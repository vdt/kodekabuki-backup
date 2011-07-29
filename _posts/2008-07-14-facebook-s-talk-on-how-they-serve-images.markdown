--- 
layout: default
title: Facebook's talk on how they serve images
tags: []

type: link

---
<a href="http://beta.flowgram.com/f/p.html#2qi3k8eicrfgkv">Facebook's talk on how they serve images</a>

If you do not have time to watch the whole presentation, here's what you need to know:

* Currently most of the time images are served off the CDN (99% for profile images, 92% for photo albums).
* POSIX filesystems store a lot of meta-data associated with each file which they don't care about (eg: last-modified-time). Reading an image file would involve doing roughly 3 separate disk operations. Should ideally be just 1 operation.
* So they went ahead and built a new system called "Haystack" (needles in a haystack, get it?). The idea is to just club together multiple files into a single file on the disk. And then store the meta-data for these files in an in-memory index + on-disk index (roughly 1MB of meta-data for 1 GB of actual data).
* They slapped a HTTP API on top of Haystack. POST requests to write images. And GET to fetch images from the haystacks.
* Interestingly they wrote this HTTP layer using evhttp which is a HTTP implementation on top of libevent. I've been writing [eventstorm](http://github.com/mallipeddi/eventstorm/tree/master) which is a Python library to help you build light-weight network servers using asynchronous I/O on top of libevent.

At [Circos](http://www.circos.com), we do something similar to store/retrieve user reviews.
