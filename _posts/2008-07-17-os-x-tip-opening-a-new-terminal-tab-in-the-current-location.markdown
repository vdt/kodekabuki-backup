--- 
layout: default
title: "OS X Tip: Opening a new terminal tab in the current location"
tags: []

type: regular

---
This is extremely useful while programming. Your `pwd` is /really/long/path/to/some/folder and you want to open a new tab in the OS X Terminal and navigate to the same folder. You can automate this thanks to AppleScript.

Save the following script in a file named `~/scripts/newtab.scpt`:

<pre><code>
on run argv
tell application "System Events" to tell process "Terminal" to keystroke "t" using command down
tell application "Terminal" to do script "cd " & item 1 of argv in front window
end run
</code></pre>

Then in your `~/.bashrc` or `~/.bash_profile`, add the following:

<pre><code>
alias newtab='osascript ~/scripts/newtab.scpt `pwd`'
</code></pre>

*Credits*: I found this solution [here](http://ask.metafilter.com/87956/Please-help-me-make-my-terminal-work).
