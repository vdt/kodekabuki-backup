--- 
layout: default
title: Cool hacks used to build SUSE Studio
tags: []

type: link

---
<a href="http://nat.org/blog/2009/07/linux-in-the-browser/">Cool hacks used to build SUSE Studio</a>

Nat blogged about some really cool hacks they'd to resort to build a challenging product like SUSE Studio. 

The hack to get a list of all the files changed in the filesystem during the "testdrive" is particularly interesting - they used QEMU's COW feature which essentially produces a small delta image if you do any writes in your VM while keeping the original image pristine (aka copy-on-write). They then use libext2fs to just parse through this delta image to get a list of all the files which were modified and display them in a web-page.
