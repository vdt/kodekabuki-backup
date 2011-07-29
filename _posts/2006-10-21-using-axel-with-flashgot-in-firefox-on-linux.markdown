--- 
layout: default
title: Using Axel with Flashgot in Firefox on Linux
tags: []

type: regular

---
I was using Ubuntu this morning and realised that I have sort of become addicted to Flashget on Windows to download stuff really quick and cannot tolerate the slow speed of Firefox's in-built Download Manager. <br /><br />Anyways I finally found the replacement for Flashget on Linux - Axel. If you're on Ubuntu/Debian, just do #apt-get install axel. Axel can open multiple connections and download things quicker just like Flashget. But the only problem is it does not have an UI.<br /><blockquote>#!/bin/bash<br /><br /># axel_flashgot.sh<br /># This is a script meant for the Firefox extension Flashgot to run Axel<br /># Author: Harish Mallipeddi<br /><br />cd /path/to/downloads_folder<br />gnome-terminal --command="axel $1"<br /></blockquote>Open Firefox. Right-click on the link to download. Click on Flashgot Options from the popup menu and add the above shell script as a downloader program. And done!<br /><br />Technorati Tags: <a href="http://technorati.com/tag/axel" rel="tag">axel</a>, <a href="http://technorati.com/tag/linux" rel="tag">linux</a>, <a href="http://technorati.com/tag/flashget" rel="tag">flashget</a>, <a href="http://technorati.com/tag/flashgot" rel="tag">flashgot</a>, <a href="http://technorati.com/tag/ubuntu" rel="tag">ubuntu</a>, <a href="http://technorati.com/tag/download%20manager" rel="tag">download manager</a><br /><br /><p class="poweredbyperformancing">powered by <a href="http://performancing.com/firefox">performancing firefox</a></p>
