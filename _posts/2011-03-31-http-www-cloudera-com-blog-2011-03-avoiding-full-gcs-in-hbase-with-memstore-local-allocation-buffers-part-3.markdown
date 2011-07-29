--- 
layout: default
title: http://www.cloudera.com/blog/2011/03/avoiding-full-gcs-in-hbase-with-memstore-local-a...
tags: []

type: link

---
<a href="http://www.cloudera.com/blog/2011/03/avoiding-full-gcs-in-hbase-with-memstore-local-allocation-buffers-part-3/">http://www.cloudera.com/blog/2011/03/avoiding-full-gcs-in-hbase-with-memstore-local-allocation-buffers-part-3/</a>

Great series of blog posts on some HBase GC optimization work by [Todd Lipcon](http://twitter.com/tlipcon) at Cloudera.

Problem: Long GC pauses were being observed for write-heavy HBase workloads on the RegionServer. One RegionServer is responsible for several regions, and all writes to a Region go to a MemStore which gets flushed to HDFS only after a certain threshold (which means the objects in MemStore make it to tenured generation). Assuming random distribution of writes to regions, memory gets fragmented in the tenured generation because memory for different regions gets interleaved.

Solution: Allocate memory for KVs in MemStore from Region-specific chunks. A chunk is merely just a contiguous byte array. So when a Region's MemStore gets flushed, it doesn't fragment memory much. Here's the [original JIRA](https://issues.apache.org/jira/browse/HBASE-3455) which also has the patch.
