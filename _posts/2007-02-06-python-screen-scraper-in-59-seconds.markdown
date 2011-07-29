--- 
layout: default
title: Python Screen-scraper in 59 seconds
tags: []

type: regular

---
In response to Ilya's "<a href="http://www.igvita.com/blog/2007/02/04/ruby-screen-scraper-in-60-seconds/">Ruby Screen-scraper in 60 seconds</a>" post, here's my Python version. The script uses <a href="http://effbot.org/zone/element-soup.htm">ElementSoup</a>. And as Ilya suggested, I used Firebug to grab the XPath. It basically grabs the blog URLs from <a href="http://www.sgblog.com">sgblog.com</a>. It is a little bit complex because the default URLs grabbed from the HTML source actually redirect to the true URLs. There's some extra code to do just that!

<pre><code>
#! /usr/bin/env python
# -*- coding: utf8 -*-

"""
Scrapes blog urls from sgblog.com

@author: Harish Mallipeddi
@organization: http://poundbang.in/
@copyright: Copyright 2005 Harish Mallipeddi
@license: GNU GPLv2 or Later
@contact: harish.mallipeddi@gmail.com
"""

import ElementSoup # download from: http://effbot.org/zone/element-soup.htm
import urllib, urlparse, urllib2

BLOGCOUNT = 50
SGBLOGURL = "http://www.sgblog.com/?number%5B1%5D=" + str(BLOGCOUNT) + "&thefield%5B1%5D=hits"

class MyRedirectHandler(urllib2.HTTPRedirectHandler):
	"""
	Prints the new url and raises HTTPError to avoid fetching the page from the new url.
	"""
	def redirect_request(self, req, fp, code, msg, headers, newurl):
	    print newurl
	    raise urllib2.HTTPError(req.get_full_url(), code, msg, headers, fp)

def grabBlogUrls():
    """
    Fetches the HTML page. Finds the anchor tags. Grabs the redirected urls.
    """
    html = ElementSoup.parse(urllib.urlopen(SGBLOGURL))
    for anchor in html.findall(".//form/a"):
        href = urlparse.urljoin(SGBLOGURL, anchor.get("href"))
        if not href.startswith(SGBLOGURL):
            request = urllib2.Request(href)
            opener = urllib2.build_opener(MyRedirectHandler)
            try:
                f = opener.open(request)
            except urllib2.HTTPError:
                pass    
    return 

def main():
    grabBlogUrls()    

if __name__ == "__main__":
	main()
</code></pre>
