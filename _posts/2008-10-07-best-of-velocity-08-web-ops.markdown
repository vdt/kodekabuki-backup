--- 
layout: default
title: "Best of Velocity '08: Web Ops."
tags: []

type: regular

---
I finally had time tonight to look at the presentations from [Velocity 08](http://en.oreilly.com/velocity2008/public/schedule/proceedings). If you're interested, they're all available on the [Oreilly conference website](http://en.oreilly.com/velocity2008/public/schedule/proceedings).

Personally I thought the following two talks were awesome:

*  Capacity Management by John Allspaw (Flickr Ops Mgr) [[PPT](http://assets.en.oreilly.com/1/event/7/Capacity%20Management%20Presentation.ppt)]
*  Building an Automated Infrastructure by Adam Jacob [[PPT](http://assets.en.oreilly.com/1/event/7/Building%20an%20Automated%20Infrastructure%20Presentation.ppt)]

John Allspaw has a new book titled "The Art of Capacity Planning" and there's an interview of him on the [HighScalability blog](http://highscalability.com/how-succeed-capacity-planning-without-really-trying-interview-flickrs-john-allspaw-his-new-book) mostly talking about his book. Key takeaway from his slides is "capacity planning" should be tied to application-level metrics (# of photos processed, etc) not just system-level metrics (# of busy Apache procs, disk-I/O). 

Adam Jacob's talk is a comprehensive guide to what steps need to be taken in order to achieve a 100% automated infrastructure. He has a nice checklist in one of his slides:

* OS Install - Get an operating system up and on a network
* DNS - Give your new system a name
* Server Inventory - Have a place where you keep track of each system, and what it does (iClassify)
* Identity Management - Grant your users access and privileges to your new servers (LDAP)
* Version Control - Keep track of the changes to your application code, and ideally, your infrastructure too (SVN, git)
* Configuration Management - Keep track of how each system is configured, and update it when you make changes (Puppet)
* Monitoring - Watch your new systems for signs of trouble (Nagios)
* Trending - Make graphs and charts of important metrics, so that you can tell if the infrastructure is behaving well, and predict future capacity (Ganglia, Cacti)
* Application Deployment - Actually put your application on the infrastructure, and update it (Capistrano)

There are a lots of new things I need to play with and explore - LDAP, DNS servers, Nagios, Ganglia, Puppet, Capistrano. Expect a lot of follow-up posts on these topics soon!
