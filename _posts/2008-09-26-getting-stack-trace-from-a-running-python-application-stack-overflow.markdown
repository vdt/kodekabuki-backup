--- 
layout: default
title: Getting stack trace from a running Python application - Stack Overflow
tags: []

type: link

---
<a href="http://stackoverflow.com/questions/132058/getting-stack-trace-from-a-running-python-application">Getting stack trace from a running Python application - Stack Overflow</a>

This recipe is really cool. In order to debug a long-running Python process (if not you could just use pdb), you register a signal handler (for SIGUSR1). When you need to debug the process, send the process the signal. The signal handler then prints the stack trace, starts an interactive console (using the `code` module) and populates the context with the globals() and locals() from the current stack frame. Pressing Ctrl-D will quit the interactive console, and the process will continue.
