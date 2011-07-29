--- 
layout: default
title: http://www.scribd.com/doc/53197944/Linux-and-H-W-optimizations-for-MySQL
tags: []

type: link

---
<a href="http://www.scribd.com/doc/53197944/Linux-and-H-W-optimizations-for-MySQL">http://www.scribd.com/doc/53197944/Linux-and-H-W-optimizations-for-MySQL</a>

Comprehensive list of things to think about both at the hardware and Linux level in order to run and maintain MySQL servers.

Some interesting things I didn't know before:

* *nobarrier* mount option - barriers are pretty similar to memory barriers, and are useful for filesystem journal updates. If the disk has a volatile cache (without a BBU), and if it tries to reorder writes, then bad things can happen during crashes. If there's a BBU, then barrier can be safely disabled in exchange for better write performance. Also ext4 has [journal checksumming](http://en.wikipedia.org/wiki/Ext3#No_checksumming_in_journal) unlike ext3 which safeguards against these scenarios.
* Use RAID10+HDD for sequential writes (redo log, bin log, double-write buffer) and SSD for random I/O (data files, undo log tablespace).
* When you set innodb_flush_method=O_DIRECT, only the data files are opened with O_DIRECT. InnoDB redo logs, bin-logs, etc are still opened normally and hence get cached in the page cache. This is done because O_DIRECT enforces the 512-byte alignment restriction for all file I/O.
* BBCs need to recharge every 90 days typically. Instantly performance goes down, because you switch from write-back to write-through mode. Solution: use FBWC (Flash-backed write cache).
* Appending + fsync() is much slower than overwriting + fsync()
* iostat's **%util = (r/s + w/s) * svctm** Checking svctm is more useful to see if the same I/O ops are taking more time now than before.
