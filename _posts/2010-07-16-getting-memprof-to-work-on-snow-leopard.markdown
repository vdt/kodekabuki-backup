--- 
layout: default
title: Getting memprof to work on Snow Leopard
tags: []

type: regular

---
[memprof](http://timetobleed.com/memprof-a-ruby-level-memory-profiler/) is a memory-profiler for Ruby (specifically MRI). It's great for performance analysis, debugging memory leak issues, etc. But unfortunately it doesn't work with the default Ruby that ships with Snow Leopard since there are no debug symbols installed. There are a few other restrictions at this point - memprof actually rewrites x86 binary in memory which is why it's difficult to get it to work everywhere. Joe Damato, author of memprof has a bunch of interesting [blog](http://timetobleed.com/hot-patching-inlined-functions-with-x86_64-asm-metaprogramming/) [posts](http://timetobleed.com/rewrite-your-ruby-vm-at-runtime-to-hot-patch-useful-features/) explaining how memprof actually works underneath if you're curious.

So here are the steps to install a new ruby interpreter (with debug symbols), rubygems and memprof gem:

<script src="http://gist.github.com/478109.js"></script>

Here's the [direct link](http://gist.github.com/478109) to the Gist embedded above.
