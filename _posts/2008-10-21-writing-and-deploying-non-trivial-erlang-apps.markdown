--- 
layout: default
title: Writing and deploying non-trivial Erlang apps
tags: []

type: regular

---
I recently wrote a twitter bot in Erlang which taught me a lot of things about writing Erlang programs. This was my first non-trivial Erlang program. Quite frankly it left me with a lot of new unanswered questions. 

## How much to OTPify? ##

It seems like when someone writes an Erlang app, they roughly go through the following steps:

*  Use vanilla Erlang processes (hook things up with links and trap-exits).
*  Switch to using gen_servers and supervisors.
*  Package as an application (implement the `application` behaviour and add a .app file).
*  Create a release (add a .rel spec file; create a boot script).
*  Installing a release.
*  Support for upgrades.

Btw Mitchell Hashimoto has a great [series of articles](http://spawnlink.com/) on this exact topic on his blog which is where I learnt most of this from. For my bot, I stopped with packaging it as an application and didn't do the rest of the steps. I start the bot by doing `application:start(mybot)`. I get to do `application:loaded_applications()` in the shell to see if my app is running. When the time comes to deploy the bot, I tar up my code, scp that tarball to the production box, untar and just start the app in the shell. So far this works great for this bot. But how do folks do this in a real professional setting?

There's very little reading material right now on topics like this. I feel like someone needs to explain and show you exactly the benefits you get by incrementally OTPifying your app. I bought the early-access edition of Manning's new OTP book but so far I didn't find anything interesting in that book.

## Deploying Erlang daemons ##

Armstrong's book and a lot of other online tutorials show you how to start/stop simple Erlang programs from within an Erlang shell. But what they don't tell you is how to run daemons non-interactively without using the shell and I only figured this out after searching for a while in the Erlang mailing list. 

### -noshell flag ###

`-noshell` flag prevents the Erlang shell from being started but the output from the program is still printed out to your console. `-s` flag can be used to execute arbitrary MFAs. Supplied args will be sent to the function as atoms. If you want them to be sent as strings, use the `-run` flag instead. More info: [man erl](http://www.erlang.org/doc/man/erl.html)

<pre><code>
%% supplied MFA should be a loop; otherwise it will stop immediately.
$erl -noshell -s Mod Func Arg -s init stop

%% use the -noinput flag; otherwise it enters the STOPPED state immediately.
$erl -noshell -noinput -s Mod Func Arg > myprog.out &
</code></pre>

### -detached flag ###

`-detached` flag starts an Erlang node completely detached from your console. This would mean you cannot see the output from the program unlike -noshell. But you can use the `-remsh` flag to start a new Erlang shell and connect to the previously started `-detached` node. More info: read Joe Armstrong's [tutorial](http://www.sics.se/~joe/tutorials/web_server/web_server.html) on this topic.

Since you cannot see the output in the console, I replaced all my io:format/2 calls with appropriate error_logger calls and I setup multi-file rotating logs (as described in Armstrong's book). But unfortunately when I used methods from the report browser (rb) module in order to parse the logs, the output seemed like it went to the `-detached` node instead of the node I made the invocation from. One patch from the mailing list confirmed that this was a bug in the report browser module.

### embedded mode - run_erl and to_erl ###

I finally settled on using the embedded mode. `run_erl` takes in a $PIDDIR and a $LOGDIR, starts the Erlang program. Output is automatically logged to files in the $LOGDIR and you get log rotation for free. Supply `to_erl` the pid, and you get back into the shell running the program. You can execute new commands from this shell. This is sorta like using the `screen` command. More info: [run_erl and to_erl](http://www.erlang.org/doc/embedded/embedded_solaris.html#1.5.2). But this comes with its own caveat - if two users use `to_erl` at the same time, then the behavior is not explained.

