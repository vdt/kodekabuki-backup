--- 
layout: default
title: "Git: Undo last commit & put changes back in working tree"
tags: []

type: regular

---
<pre><code>
git reset --soft HEAD^
</code>
</pre>

Now try `git status` and your changes from previous commit should be placed back in the working tree and the last commit should be missing from `git log`
