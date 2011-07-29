--- 
layout: default
title: After examining the write syscall sizes, I also like to examine the write throughput ...
tags: []

type: quote

---
> After examining the write syscall sizes, I also like to examine the write throughput vs. time relative to the Write IOPS. This type of plot can help explain the IO behavior a bit more. For example, if there is a great deal of throughput and little IOPS then the application may be doing large streaming writes (checking the previous plot will also help determine that). Or the plot can help explain why you are getting a large Write IOPS value without much throughput where perhaps there are small writes with a large number of lseeks in between.

<a href="http://www.linux-mag.com/id/7730/1/">IO Profiling of Applications: strace_analyzer</a> via [@phunt](http://twitter.com/phunt)

Article explaining how to use strace plus a bunch of scripts to do statistical analysis for understanding the I/O characteristics of a given application. 
