--- 
layout: default
title: Use the Blackhole gambit. Facebook is rumored to use the Blackhole storage engine to ...
tags: []

type: quote

---
> Use the Blackhole gambit. Facebook is rumored to use the Blackhole storage engine to populate cache. Data written to a Blackhole table is replicated to cache. Facebook uses it more to invalidate data and for cross country replication. The advantage of this approach is the data is not replicated through MySQL which means there are no binary logs for the data and it's not CPU intensive.

<a href="http://highscalability.com/bunch-great-strategies-using-memcached-and-mysql-better-together">A Bunch of Great Strategies for Using Memcached and MySQL Better Together | High Scalability</a>
