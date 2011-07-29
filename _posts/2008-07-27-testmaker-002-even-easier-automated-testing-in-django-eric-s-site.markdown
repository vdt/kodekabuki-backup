--- 
layout: default
title: Testmaker .002 (Even easier automated testing in Django) | Eric's Site
tags: []

type: link

---
<a href="http://ericholscher.com/blog/2008/jul/26/testmaker-002-even-easier-automated-testing-django/">Testmaker .002 (Even easier automated testing in Django) | Eric's Site</a>

This is a nifty hack for generating automated tests. It's a Django middleware which sits and records all the actions that you do from within your browser and then logs all these actions and the expected output in the Python `doctest` format to a file. You can basically grab this file and use it in your test suite! The idea is very similar to Selenium-RC.
