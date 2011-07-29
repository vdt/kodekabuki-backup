--- 
layout: default
title: MRI's memory allocation behaviour
tags: []

type: link

---
<a href="http://www.engineyard.com/blog/2010/mri-memory-allocation-a-primer-for-developers/">MRI's memory allocation behaviour</a>

Insightful article. In short, MRI maintains its own heap space to store meta-data about Ruby objects. This heap space is divided into multiple groups and each group has `slots` of size 20 bytes (32-bit)/40 bytes (64-bit) each. Each slot is meant to hold a C-struct called `RVALUE`. Number of slots allocated increases by a factor of 1.8 beginning with 10,000+1 slots in the first iteration. Objects implemented in C/C++ allocate memory on the C heap directly to hold their internal data.
