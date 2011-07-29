--- 
layout: default
title: If your object is responding to a method/message, and crashes halfway through, any ch...
tags: []

type: quote

---
> If your object is responding to a method/message, and crashes halfway through, any changes you made to instance variables are rolled back to before the method is invoked. Transactional semantics, provided by gen_server, should hopefully help alleviate the problem of object state being corrupted by calls which error out halfway through after modifying instance variables.

<a href="http://tonyarcieri.org/articles/2008/09/24/reia-classes-and-objects">Reia: Classes and Objects! : The Art of Science</a>
