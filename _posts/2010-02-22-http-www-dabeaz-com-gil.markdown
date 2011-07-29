--- 
layout: default
title: http://www.dabeaz.com/GIL/
tags: []

type: link

---
<a href="http://www.dabeaz.com/GIL/">http://www.dabeaz.com/GIL/</a>

David Beazley continues his GIL investigation work from his ChiPy '09 talk. This time he also analyses the new GIL optimizations that are apparently present in the Python 3.2 svn branch. Look at his slides to see how the new GIL performs!

It took surprisingly little amount of code changes to the Python interpreter to do this kind of investigative work ([Read more](http://www.dabeaz.com/blog/2009/08/inside-inside-python-gil-presentation.html) about his code changes). He maintains a bunch of counters for each time `t`, and then logs them at the end to a file. He then renders this data in a timeline for better understanding - the output of this step is some humungous PNG file. So then he splits the PNG image, tiles it up, and then uses a Google Maps kinda interface to view the tiles, zoom in/out etc.
