--- 
layout: default
title: CouchDB naked
tags: []

type: regular

---
Few months ago I spent sometime browsing through the entire CouchDB source code because this seemed like the best way to learn how large-sized Erlang (and specifically OTP) apps get written. Other choices were to look at ejabberd or RabbitMQ but they were a bit intimidating because you've the added complexity of understand the XMPP and AMQP protocols. I'll be doing a series of blog posts covering some interesting aspects of the CouchDB implementation. I'm going to assume that you know a little bit of Erlang and you're familiar with CouchDB itself.

So in this first part of the series dubbed "CouchDB naked", I'm going to show you what CouchDB looks like if you strip off all the bells and whistles. At the heart of CouchDB is a B-Tree implementation (file-based, append-only) with one extra feature - the ability to stash "reduction" values along with the pointers to child nodes. CouchDB b-trees have two types of nodes - *key-pointer nodes* (kp-node) and *key-value nodes* (kv-node). The key-value nodes are the leaf nodes and store the actual `{Key, Value}` pairs. The key-pointer nodes store a bunch of `{Key, Pointer, Reduction}` tuples (one each for child nodes that they point to). The *Pointer* is just an offset in the file where that child node has been stored. *Reduction* is the result of applying `reduce()` to all the KV pairs in that child sub-tree.

## CouchDB B-Tree

<img src="http://img.skitch.com/20090630-ttj5fi447c2nki4ajaiaawauwn.jpg" alt="couchdb-btree"/>

The diagram above shows how a simple CouchDB B-tree might look like. Here the `reduce()` function is a simple `sum()` function which adds up all the values. Intermediate sums are stored at the parent nodes in the B-tree. If values get added/deleted/updated in the sub-trees, then `reduce()` needs to be re-run only for that sub-tree. This is why CouchDB's map-reduce is **incremental**. Also this is why your reduce() function needs to be *associative* and *commutative*. Read more about CouchDB's incremental map-reduce on [Damien's blog](http://damienkatz.net/2008/02/incremental_map.html).

## Erlang implementation

CouchDB B-Trees that I described above are implemented in a single file `couch_btree.erl` in the CouchDB source tree. This depends on `couch_file.erl` which as the name suggests, provides an API for doing file I/O. At this point let us look at the APIs exposed by these two erlang modules:

<script src="http://gist.github.com/138189.js"></script>

Interesting things to notice:

 * `couch_file` is a `gen_server` - all file I/O requests for a file go through one gen_server instance thereby serializing access to this shared resource.
 * `couch_file` exposes read methods to read from anywhere in the file. There's no write(). There's only a write_header() and append() methods. This is what CouchDB folks always advertise - all write I/O in CouchDB is append-only except for when you've to update the header (small static block at the beginning of the file).
 * (De)serialization - How does CouchDB store info on disk? It just stores them as Erlang terms! In Erlang, any valid Erlang term can be converted into binaries via term_to_binary/1 and converted back via binary_to_term/1. Each node in the b-tree itself is serialized in this manner.

<script src="http://gist.github.com/138192.js"></script>

`couch_btree` relies on `couch_file` to do all file I/O. `couch_btree` is not a gen_server.

## An Experiment

Given that we now know how CouchDB works underneath, can we build something useful using just the APIs exposed by `couch_btree` and `couch_file` modules? Yes we can. We'll develop a light-weight CouchDB clone which stores some data retrieved from the Twitter API (because Twitter is omni-present). Given a list of followers of a user, we would like to get the counts of followers per timezone.

<script src="http://gist.github.com/138194.js"></script>
<script src="http://gist.github.com/138193.js"></script>

The code snippet above shows two Erlang modules that I wrote - `mattress.erl` and `tweetbed.erl`. `mattress.erl` exposes a behaviour and `tweetbed.erl` implements it (ie) implements `map()` and `reduce()` functions in Erlang. In the map() function, we generate a list of `{userid, {user}}` tuples by calling Twitter's API. In the reduce() function, we simply aggregate counts of users by the timezone they belong to. This is very similar to what you might write in your Javascript view functions in CouchDB.

To compile and run the code, use a Makefile like the one below:

<script src="http://gist.github.com/138184.js"></script>

Here's some sample output the program generates:

<script src="http://gist.github.com/138182.js"></script>

The console output above shows the `fullreduce` value which in this case is an Erlang `dict` containing counts for each timezone. I ran this for my twitter username - hence  the most common timezones seem to be Singapore (which is where I used to live until recently) and US - Central and Pacific time (which is where most of the geeks are!).

Hope you found this post educational as an Erlang/CouchDB newbie. Let me know what else you want to know about CouchDB.
