--- 
layout: default
title: http://www.lighterra.com/papers/modernmicroprocessors/
tags: []

type: link

---
<a href="http://www.lighterra.com/papers/modernmicroprocessors/">http://www.lighterra.com/papers/modernmicroprocessors/</a>

This article provides an excellent overview of the current state of modern microprocessor design for '*software engineers*'.

Key concepts/ideas
-----------------

* **Super-pipelining** - Pipeline instructions aggressively - split complex sections within fetch-decode-execute-writeback into more fine-grained sub-tasks, and also increase the clock speed. Clock speed dictates how often an instruction moves ahead one step in the pipeline. Core 2 has a 14-stage pipeline; Pentium-4 has a 20-stage pipeline; ARM Cortex A9 (Apple A5) has a 8-stage pipeline.

* **Super-scalar** - Execute multiple instructions in parallel in different functional units. Cortex A8/A9 are 2-issue while Core 2 is 4-issue.

* **Branch prediction** - branch mispredictions could be really costly with deeper pipelines. Hence dynamic prediction with *on-chip branch prediction table* is performed in modern CPUs. Basically some space is reserved to keep count of which way a branch goes and favor that branch when it comes to pipelining.

* **In-order execution vs out-of-order execution** - Pipelining is good but not all instructions are equal (some instructions require more clock cycles to complete than other simpler instructions). So some CPUs rearrange the order in which instructions are executed. But implementing this logic is expensive (lots of logic on chip + power consumption). Hence some CPUs just rely on the compilers to do this for them. A8 and Atom only do in-order while modern x86es do out-of-order execution.

* **Simultaneous Multi-Threading (SMT) aka Intel's HyperThreading** - At some point, it's going to become hard to find instructions within the same thread/process to fill up the pipeline even with out-of-order execution because there's a huge latency involved in load/store instructions which have to read/write from main-memory (100s of cycles). So realistically you can't find more than 2 parallel instructions to execute over a long period of time. So the solution here is to find instructions from completely different threads and run them on the same processor. This needs only little bit of extra hardware to keep track of the 2 threads of execution but the rest of the pieces of logic on the chip can be shared. This is different from SMP machines where you've multiple independent processors and multi-core machines where you're multiple cores on the same chip.
