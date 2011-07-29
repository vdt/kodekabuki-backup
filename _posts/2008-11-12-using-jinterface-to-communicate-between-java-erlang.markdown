--- 
layout: default
title: Using JInterface to communicate between Java & Erlang
tags: []

type: regular

---
I figured this stuff out this morning. [JInterface](http://www.erlang.org/doc/apps/jinterface/index.html) ships by default with the Erlang distribution. JInterface implements the Erlang VM wire protocol and hence you can create pseudo Erlang-ish VMs using Java. Erlang code running on a different VM can then send/receive messages to the processes running on the Java node and vice versa. 

Here's the code (if you cannot view the GitHub gist embed, visit the [direct link](http://gist.github.com/24202)). In this example, I'm creating a process which receives messages of the format `{FromPid, some_erlang_term}` and echoes `some_erlang_term` back to `FromPid`.

<script src="http://gist.github.com/24202.js"></script>
