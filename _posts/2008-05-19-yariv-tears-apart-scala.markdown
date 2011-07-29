--- 
layout: default
title: Yariv tears apart Scala
tags: []

type: regular

---
Ok that's just a cheesy title to grab your attention. In his [recent blog post](http://yarivsblog.com/articles/2008/05/18/erlang-vs-scala/), Yariv Sadan (author of ErlyWeb framework) compares Erlang with Scala.

The article has lots of nice info on Erlang which you cannot find in Armstrong's book:

###Erlang's processes cannot block each other###

> The Erlang VM schedules processes preemptively. Each process gets a certain number of reductions (roughly equivalent to function calls) before it’s swapped out for another process. Erlang processes can’t call blocking operations that freeze the scheduler for long periods. All file IO and communications with native libraries are done in separate OS threads (communications are done using ports). Similar to Erlang’s per-process heaps, this design ensures that Erlang’s lightweight processes can’t block each other.

###Remote shell + hot code swapping = bliss###

> When the server is in a bad state, you don’t always have to try to reproduce the bug offline somehow to devise a fix. You can log right into it and see what’s wrong. If it’s not obvious, you can make quick code changes to add more logging and then revert them when you’ve discovered the problem.

###Erlang VM uses async IO calls underneath###

> Erlang processes are tightly integrated with the Erlang VM’s event-driven network IO core. Processes can “own” sockets and send and receive messages to/from sockets. This provides the elegance of concurrency-oriented programming plus the scalability of event-driven IO (the Erlang VM uses epoll/kqueue under the covers).

