--- 
layout: default
title: Using tcpdump to extract URIs to flv videos
tags: 
- unix
- tcpdump
- flv
- videodownloader
- firefox
- extension
- unplug
- flash
- download
type: regular

---
<p>Just a quick tip:</p>

<p/><pRE>$sudo tcpdump -s 1514 -Ai en1 'tcp port 80 and tcp[((tcp[12:1] &amp; 0xf0) &gt;&gt; 2):4] = 0x47455420'</PRE><p/><p>Doing the above in a Terminal would help you to monitor all HTTP GET requests. I'm currently using it to find out the URLs to the *.flv videos on most of the Flash-based video sharing sites. Unplug and VideoDownloader FF extensions sorta work only for a few well-known sites (especially not useful if someone embedded the video on their blog and didn't provide a direct link to the original video sharing website). This method will work everywhere!<br />
 </p>


