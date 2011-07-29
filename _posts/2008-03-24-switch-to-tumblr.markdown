--- 
layout: default
title: Switch to Tumblr
tags: []

type: regular

---
Over the weekend, I've moved my custom Django blog to [Tumblr](http://www.tumblr.com). If you're subscribed to my blog via the [FeedBurner](http://feeds.feedburner.com/poundbangin) feed, it's all good (although Google Reader took a while before it updated itself).

I made the switch because I'm going to start writing less often (and I already do) and instead just point you to useful links that I discover much like how [Simon Willison](http://simonwillison.net/) does on his blog. If you don't read his blog, you must! And Tumblr just seemed like a great fit for this purpose. 

Besides Tumblr has the simplest [API](http://www.tumblr.com/api) in the planet - importing all the old posts from my Django blog was exactly the following 4 lines in Python:

    posts = Post.objects.all()
    for post in posts:
      params = urllib.urlencode({...params-as-per-the-api...})
      r = urllib.urlopen("http://www.tumblr.com/api/write/", params)
      print r.read()

