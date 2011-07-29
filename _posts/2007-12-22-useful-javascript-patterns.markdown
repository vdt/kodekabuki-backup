--- 
layout: default
title: Useful Javascript patterns
tags: 
- javascript
- design
- pattern
- programming
- yahoo
- yui
- performance
- tips
- browser
- dom
type: regular

---
<p><a href="http://www.julienlecomte.net">Julien Lecomte</a> (author of YUI Compressor) gave a talk titled "High Performance Ajax Applications" (<a href="http://www.slideshare.net/julien.lecomte/high-performance-ajax-applications">Slides</a>). The talk is extremely useful and I highly recommend it (actually not just this one; all the talks at <a href="http://developer.yahoo.com/yui/theater/">YUI Theatre</a> are brilliant).</p>

<p>There are a few patterns which caught my eye: lazy function definition, using setTimeout() to handle long-running tasks without freezing the UI, and event delegation/event bubbling. I'm going to steal code samples from his slides to illustrate them here.</p>

<p>
<b>Lazy function definition</b><br/>
if you need to do an expensive task only once (the first time the function is called), then you redefine the function with the result of that expensive computation cached (you might refer to this as memoization). <a href="http://peter.michaux.ca/article/3556">Read more...</a>.<br/><br/>
<img src="http://myskitch.com/harish_mallipeddi/lazy_func_def-20071222-182235.jpg" alt="Lazy Func Def"/>
</p>

<p>
<b>Handling long-running tasks sensibly using setTimeout()</b><br/>
You would notice in the snippet below that the timeout period is actually 0 seconds which might seem counter-intuitive. But that's sufficient for the browser to cater to outstanding UI redrawing tasks before coming back to evaluating the Javascript code.<br/><br/>
<img src="http://myskitch.com/harish_mallipeddi/long_running_javascript-20071222-182405.jpg" alt="Long running javascript"/>
</p>

<p>
<b>Event delegation/event bubbling</b><br/>
Instead of attaching a callback for an event on each of the child elements (which can be costly in terms of memory), just attach it to the container element and then use the event.target property to handle the event properly.<br/><br/>
<img src="http://myskitch.com/harish_mallipeddi/dock-20071222-180515.jpg" alt="Dock"/><br/><br/>
<img src="http://myskitch.com/harish_mallipeddi/event_delegation_optimization-20071222-180626.jpg" alt="Event Delegation Optimization"/>
</p>

<p>I have been aggregating so many cool Javascript patterns lately, I'm thinking I should compile all of them into one easy presentation.</p>
