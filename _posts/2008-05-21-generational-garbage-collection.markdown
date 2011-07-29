--- 
layout: default
title: Generational Garbage Collection
tags: []

type: link

---
<a href="http://www.ibm.com/developerworks/java/library/j-jtp11253/#2.0">Generational Garbage Collection</a>

98% of all Java objects instantiated are apparently short-lived. Generational GC classifies objects in the heap into multiple generations (young vs old) and attempts garbage collection first on the younger generations and then on the older ones.

On a sidenote in Erlang, GC happens per-process and hence it is quick. This is possible because Erlang processes do not share any state. Ultimately the end goal seems to be to avoid these long, recurring GC cycles during which everything gets frozen. The smaller the graph to traverse, the shorter the GC cycle.
