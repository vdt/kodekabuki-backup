--- 
layout: default
title: ExCanvas.js - Getting it to work with dynamically added canvas tags
tags: 
- code
- javascript
- firefox
- ie
- browser
- opensource
- excanvas
- google
- library
- canvas
- graphics
- browser
type: regular

---
<p>I've been using Google's <a href="http://excanvas.sourceforge.net/">ExplorerCanvas</a> Javascript library at work to get &lt;canvas&gt; tags to work with IE. For those who didn't know, &lt;canvas&gt; tag support exists in Firefox but not in IE. But IE has VML. Nice folks at Google wrote a wrapper around this to simulate &lt;canvas&gt; tags in IE and released the resulting library under a Opensource license.</p>

<p>For the most part, the use of ExCanvas is transparent. You include it in your HTML file and if the file is being rendered in IE, it will look for all &lt;canvas&gt; tags in the document and replace them accordingly. But if you wanted to add &lt;canvas&gt; tags dynamically like I did, then you need to do something extra. After a bit of searching in Google, I finally found the solution posted by someone else <a href="http://groups.google.com/group/google-excanvas/msg/86078ae7de7c10d9">here</a>.</p>

<p>
<pre>
// new canvas element
var canvasElem = document.createElement('canvas');
// you need to add canvasElem to the document before doing anything else.
document.getElementById(someId).appendChild(canvasElem);
// if it is IE...
if (typeof G_vmlCanvasManager != 'undefined') {
    // you've to reassign the variable to the new element created by initElement
    canvasElem = G_vmlCanvasManager.initElement(canvasElem);
}
canvasElem.setAttribute("width",w);
canvasElem.setAttribute("height",h);
canvasElem.setAttribute("id",someCanvasId);
// now you can do getContext on this canvasElem...
</pre>
</p>
