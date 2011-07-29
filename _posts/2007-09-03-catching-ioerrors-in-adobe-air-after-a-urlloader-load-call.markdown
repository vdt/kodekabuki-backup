--- 
layout: default
title: Catching IOErrors in Adobe AIR after a URLLoader.load() call
tags: 
- adobe
- air
- html
- javascript
- ajax
- urlloader
- exception
type: regular

---
<p>
If you read Adobe AIR's HTML documentation (atleast as of today), it doesn't tell you how to catch an IOError which can occur if you're attempting to download a file but the server hosting the file is unreachable.
</p>

<p>Here's the correct event to bind your URLLoader object to:</p>

<p>
<pre>
    function onDownloadComplete(event) {
        var data = event.target.data;
        // do something with data
    }
    function onDownloadError(event) {
        air.trace("Unable to fetch");
    }
    var request = new air.URLRequest("http://example.com/sample.txt"); 
    var loader = new air.URLLoader(); 
    loader.dataFormat = air.URLLoaderDataFormat.TEXT;
    loader.addEventListener(air.Event.COMPLETE, onDownloadComplete); 
    loader.addEventListener(<b>air.IOErrorEvent.IO_ERROR</b>, onDownloadError);
    loader.load(request);
</pre>
</p>
