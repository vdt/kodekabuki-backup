--- 
layout: default
title: Last.fm uses MogileFS with SSDs
tags: []

type: link

---
<a href="http://blog.last.fm/2009/12/14/launching-xbox-part-2-ssd-streaming">Last.fm uses MogileFS with SSDs</a>

Summary:

1.  They used SSDs to store *hot songs*.
1.  They picked the simple FIFO noop scheduler in the Linux I/O subsystem. For more info on the different schedulers, read Redhat's [IO Tuning Guide](http://www.redhat.com/docs/wp/performancetuning/iotuning/index.html). They also set `read_ahead_kb` to a very low value since seek times are so low for SSDs anyway.
1.  Modified MogileFS to differentiate between storage nodes with SSDs and nodes with regular HDDs.
1.  1 SSD => 7000 requests vs 1 7200rpm SATA => 300 requests.
