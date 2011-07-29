--- 
layout: default
title: |-
  REPLACE INTO Tickets64 (stub) VALUES ('a');
  SELECT LAST_INSERT_ID();
tags: []

type: quote

---
> REPLACE INTO Tickets64 (stub) VALUES ('a');
SELECT LAST_INSERT_ID();

<a href="http://laughingmeme.org/2010/02/08/ticket-servers-distributed-unique-primary-keys-on-the-cheap/">  Ticket Servers: Distributed Unique Primary Keys on the Cheap -  Laughing Meme </a>

Kellan describes the hack they use at Flickr to (atomically) generate globally unique auto-increment ids across shards. Redis would be great for something like this.
