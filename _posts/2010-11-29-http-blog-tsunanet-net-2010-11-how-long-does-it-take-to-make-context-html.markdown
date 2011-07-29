--- 
layout: default
title: http://blog.tsunanet.net/2010/11/how-long-does-it-take-to-make-context.html
tags: []

type: link

---
<a href="http://blog.tsunanet.net/2010/11/how-long-does-it-take-to-make-context.html">http://blog.tsunanet.net/2010/11/how-long-does-it-take-to-make-context.html</a>

Interesting article - the author sets out to write a micro-benchmark to measure the cost of a context switch in Linux on different x86 hardware.

  * Cost of context switch cannot be measured simply by making syscalls to enter/leave kernel mode because in modern Linux kernels apparently that doesn't cause a full context switch.
  * Benoit decides to use futexes - parent and child processes waiting on the futex wake each other up taking turns (thereby context switching).
  * Setting processor affinity has a very visible impact.
  * More than the actual overhead of a context switch, in real life scenarios, L1/L2 cache pollution due to context switches is more detrimental.
  * Cost of context switch estimated - 30µs

Overall it's a very interesting article. Also check out his [benchmark code](https://github.com/tsuna/contextswitch) on github.
