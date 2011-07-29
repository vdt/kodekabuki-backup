--- 
layout: default
title: "Google News Photo Mismatch: Interesting CS problem yet to be solved"
tags: []

type: regular

---
I've noticed this happen a lot of times. Finally I decided to take a few minutes to capture a couple of screenshots to illustrate the problem.

<a href="http://photos1.blogger.com/blogger/5910/574/1600/google_news_photo_mismatch.jpg"><img border="0" src="http://photos1.blogger.com/blogger/5910/574/320/google_news_photo_mismatch.jpg" /></a>
The above is a screenshot of a news item from the Google News website (taken on 21/06/06 2:08AM). The news item is a Reuters article which talks about Israel. But the picture next to it is clearly that of English football player Rooney. If you're wondering why this happens, take a look at the screenshot below.

<a href="http://photos1.blogger.com/blogger/5910/574/1600/google_news_photo_mismatch1.jpg"><img border="0" src="http://photos1.blogger.com/blogger/5910/574/320/google_news_photo_mismatch1.jpg" /></a>

The one above is the page you'll arrive at if you click on the Israel news item. Google News I guess tries to find an image for a news item by looking for pictures in that page. They probably also might be doing some sort of "distance of the path between the div tag containing the text and the  img tags in the page's DOM tree". Anyways for some reason, it decides to choose the Rooney picture over Tom Cruise :)
<div>This is a pretty interesting CS problem to solve (an opportunity for an interesting weekend hack?). Google News didn't deserve to leave "beta"!Technorati tags: <a rel="tag" href="http://technorati.com/tag/google">google</a> <a rel="tag" href="http://technorati.com/tag/news">news</a> <a rel="tag" href="http://technorati.com/tag/image">image</a> <a rel="tag" href="http://technorati.com/tag/mismatch">mismatch</a> <a rel="tag" href="http://technorati.com/tag/bug">bug</a></div>
