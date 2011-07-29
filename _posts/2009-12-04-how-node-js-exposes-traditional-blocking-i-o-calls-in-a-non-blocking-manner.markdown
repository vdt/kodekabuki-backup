--- 
layout: default
title: How node.js exposes traditional blocking I/O calls in a non-blocking manner
tags: []

type: regular

---
If you've not heard about [node.js](http://nodejs.org), do watch the video from a talk given by Ryan Dahl (project lead) at JSConfEU 2009.

<embed src="http://blip.tv/play/AYGylE4C" type="application/x-shockwave-flash" width="480" height="300" allowscriptaccess="always" allowfullscreen="true"></embed> 

The thing which I found most interesting is how he handled the shortcomings of libraries like eventmachine. eventmachine is great for building highly-scalable single-threaded network servers using async network I/O. But while writing your network servers, you've to be careful not to introduce some blocking calls in your event callbacks. Since your server is single-threaded, if you block inside the event callback then you're basically not handling any of the other incoming requests during the time that the thread was blocked. Why would you need to do blocking calls? Your MySQL client library will typically do blocking I/O. POSIX filesystem calls are blocking. There are many other such instances where the usefulness of eventmachine is reduced. So in node.js, Ryan has decided to wrap away these blocking APIs and expose them in Javascript in a non-blocking manner - basically a batteries-included arsenal of non-blocking APIs in one package if you will. Take a look at the node.js [API docs](http://nodejs.org/api.html) to get an idea of the kinds of things that are supported. 

The way node.js works underneath is that it offloads all the blocking calls to a thread-pool and when the calls finish, the results are fetched by reading off a pipe to which the threads write to. Incidentally pipes are select()-able which means these events can be handled within the main event loop of node.js in exactly the same manner as the other network socket events. I quickly implemented a barebones proof-of-concept of this idea in Python: 

<script src="http://gist.github.com/248184.js?file=gistfile1.py"></script>

Note - if you're reading this via a RSS reader, open this in a browser to see the gist code embed above.
