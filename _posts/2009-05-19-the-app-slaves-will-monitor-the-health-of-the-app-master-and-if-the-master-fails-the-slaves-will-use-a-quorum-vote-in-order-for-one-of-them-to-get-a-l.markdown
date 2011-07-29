--- 
layout: default
title: The app slaves will monitor the health of the app master and if the master fails, the...
tags: []

type: quote

---
> The app slaves will monitor the health of the app master and if the master fails, the slaves will use a quorum vote in order for one of them to get a lock. The slave that gets the lock will steal the IP address, become the new master and will kill the old master server.

<a href="http://www.infoq.com/news/2009/05/ey-flex">InfoQ: Flex: Engine Yard's New Cloud Offering</a>

Interesting approach to load-balancing instead of the usual "1 master + 1 failover-master + N slaves" setup.
