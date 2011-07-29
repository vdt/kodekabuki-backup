--- 
layout: default
title: Processes sending messages to a process with a long message queue are penalized by in...
tags: []

type: quote

---
> Processes sending messages to a process with a long message queue are penalized by increasing the number of reductions it costs to send the message. This is an attempt by the runtime system to allow processes with long message queues to catch up by slowing down the processes sending the messages in the first place.

 from O'Reilly's "Erlang Programming"
