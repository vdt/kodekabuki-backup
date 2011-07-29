--- 
layout: default
title: LZO compression for Hadoop-0.20+
tags: []

type: regular

---
Starting from Hadoop-0.20 onwards, any code related to LZO compression has been removed from the Hadoop source tree. This is because the LZO code is licensed under GPL and hence incompatible with Hadoop's Apache license. One more thing you should know is LZO compression is only supported via a native library (AFAIK there's no pure Java implementation of it). LzoCodec and LzopCodec are almost the same (LzopCodec is compatible with the output from the lzop unix utility).

Here are the steps to get LzopCodec working with Hadoop-0.20 (see the gist embed below). I'm assuming you've already downloaded and installed the Hadoop-0.20 release tarball. We'll be adding the compiled library to Hadoop-0.20's lib/ folder. Repackage it into a tarball and push it to your cluster using whatever magic you use and you should have LZO compression working.

<script src="http://gist.github.com/169730.js"></script>
