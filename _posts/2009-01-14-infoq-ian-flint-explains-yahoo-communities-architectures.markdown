--- 
layout: default
title: "InfoQ: Ian Flint Explains Yahoo! Communities Architectures"
tags: []

type: link

---
<a href="http://www.infoq.com/presentations/Yahoo-Communities-Ian-Flint">InfoQ: Ian Flint Explains Yahoo! Communities Architectures</a>

Great talk. Ian Flint runs Ops for [Yahoo! Bix](http://bix.yahoo.com) (this is the first time I've heard about Bix actually). The talk gives you a good feel of how infrastructure is setup for each of Yahoo's properties (most properties being acquired startups). 

Yahoo has its custom software package repository - all software is installed into vanilla FreeBSD boxes from this central repository. All installed software lives in a separate root. There are customized versions of Opensource packages - yapache (lots of extra modules like authentication, SSO), yts (reverse proxy), ymon (nagios + drraw + other monitoring tools).

### Direct Server Routing (DSR) ###

Yahoo's load balancers apparently do DSR. DSR basically means the load balancers just forward requests to one of the web targets and don't actually act as proxies (they don't act as the middlemen shsoveling data between the client and the web nodes). A little bit of googling reveals that the way DSR actually works is the load balancer swaps the MAC address in the request packets that it receives with the MAC address for a web node (this is the load balancing part). The switch then forwards the packet to the right web node. Each web node is configured with a loopback interface which has the exact same IP as that of the load balancer and in order to prevent conflicts ARP is disabled for that loopback interface - in other words it won't reply to ARP requests as owning the IP of the load balancer.

Yahoo! Groups surprisingly is mostly written in Python and C/C++. There's a MTA cluster written in Python named after Newman (from Seinfeld).
