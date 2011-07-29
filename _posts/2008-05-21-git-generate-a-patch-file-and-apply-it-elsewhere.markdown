--- 
layout: default
title: "Git: generate a patch file and apply it elsewhere"
tags: []

type: regular

---
Generate a patch using git-format-patch.

<pre><code>
git format-patch HEAD^
0001-Added-support-for-a-new-flag-YSLOW_OPTIMIZE.patch
</code></pre>

This generates a patch file in that folder.

Now go to a different folder where you want to apply this patch.

<pre><code>
cd /path/to/target
patch -p1 -i 0001-Added-support-for-a-new-flag-YSLOW_OPTIMIZE.patch
</code></pre>

