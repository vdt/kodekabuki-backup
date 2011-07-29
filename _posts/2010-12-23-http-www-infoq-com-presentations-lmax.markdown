--- 
layout: default
title: http://www.infoq.com/presentations/LMAX
tags: []

type: link

---
<a href="http://www.infoq.com/presentations/LMAX">http://www.infoq.com/presentations/LMAX</a>

Very insightful talk by couple of engineers from LMAX (UK). They build high-throughput, low-latency financial systems in Java. They go to extreme lengths to avoid using locks by relying on CAS+memory-barriers from JMM for concurrency control and avoiding cache misses. Read the comments below the video on the InfoQ page as well.

They emphasize on the importance of having "*mechanical sympathy*" - knowing and appreciating how things work in the layers underneath and taking advantage of that know-how for good (apparently that's what the motor racing world calls it). This is pretty much similar to the "full-stack programmer" idea in the previous post by the Facebook engineer.
