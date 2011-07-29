--- 
layout: default
title: GitHub's new architecture
tags: []

type: link

---
<a href="http://github.com/blog/530-how-we-made-github-fast">GitHub's new architecture</a>

Very well written article highlighting the new architecture of GitHub (post-Rackspace move). Every company/team should at least have a similar internal document describing their current architecture at a high-level but unfortunately doesn't happen in most companies.

GitHub seems to be using a lot of familiar Opensource projects in their stack - Nginx, Ruby/Rails/Unicorn, HAProxy, MySQL, memcached, redis, bunch of RPC services speaking the new BERT/BERT-RPC protocol. The only thing I've not really played with yet is DRBD and I've heard lots of good things about DRBD from others.

So looks like now you've Facebook's Thrift, Google's Protocol Buffers, Hadoop/Doug Cutting's Avro, just plain JSON/XML and GitHub's BERT for your (de)serialization needs!
