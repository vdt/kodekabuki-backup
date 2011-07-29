--- 
layout: default
title: python-pipeline - Google Code
tags: []

type: link

---
<a href="http://code.google.com/p/python-pipeline/">python-pipeline - Google Code</a>

Clever hack using the `__or__` (and `__ror__`) special methods in order to emulate a UNIX pipe in Python. For example:

<pre><code>
>>> xrange(-10, 10) | grep(lambda x: x % 3 == 2) \
... | (x * (x + 1) for x in STDIN) | list
>>> [90, 42, 12, 0, 6, 30, 72]
</code></pre>
