--- 
layout: default
title: Announcing django-pipes
tags: []

type: regular

---
[django-pipes][pipes-home] is a small plugin to Django that I wrote sometime back. From the [wiki][pipes-wiki],

> django-pipes module offers an abstraction layer over remote JSON data for Django apps. It is inspired by Ruby on Rails’ ActiveResource component. It provides the same semantics as Django’s ORM Manager class although currently only all(), get() and filter() methods are implemented.

I am using this at [Circos](http://www.circos.com) in order to query our search API boxes which speak JSON. Results are fetched from API boxes and cached locally in memcache by www instances.

I've created a new project at [github][pipes-home]. And I've added a [wiki page][pipes-wiki] demonstrating how to build a sample app which queries Google's AJAX Search API.

[pipes-home]: http://github.com/mallipeddi/django-pipes/
[pipes-wiki]: http://github.com/mallipeddi/django-pipes/wikis
