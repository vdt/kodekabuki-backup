--- 
layout: default
title: Core dumps on OS X
tags: []

type: regular

---
Core dumps are switched off by default. 

Make OS X do a core-dump upon a segmentation fault:

<code>ulimit -c unlimited</code>

Unlike Linux, in OS X core dumps end up in `/cores` instead of the `cwd`. 

<code>gdb /path/to/your/binary /cores/core.XYZ</code>

