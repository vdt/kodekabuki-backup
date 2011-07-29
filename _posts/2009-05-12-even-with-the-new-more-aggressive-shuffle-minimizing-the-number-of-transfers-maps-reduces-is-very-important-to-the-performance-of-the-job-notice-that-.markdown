--- 
layout: default
title: Even with the new more aggressive shuffle, minimizing the number of transfers (maps *...
tags: []

type: quote

---
> Even with the new more aggressive shuffle, minimizing the number of transfers (maps * reduces) is very important to the performance of the job. Notice that in the petabyte sort, each map is processing 15 GB instead of the default 128 MB and each reduce is handling 50 GB.

<a href="http://developer.yahoo.net/blogs/hadoop/2009/05/hadoop_sorts_a_petabyte_in_162.html">Hadoop - Petabyte sort</a>

Looks like the bottleneck and optimizations happened this time in the shuffle phase of Hadoop M/R.
