--- 
layout: default
title: decorators and doctests
tags: []

type: regular

---
Just ran into this issue while adding some tests to the Redis Python client. If you're using doctests, and the method being tested is wrapped in a decorator, then your doctest for that method won't be visible to the doctest runner. This is because when you wrap a func/method in a decorator, it [loses its docstring](http://mail.python.org/pipermail/python-dev/2004-August/047828.html) unless you set it back explicitly. In Python 2.5, you could simply avoid this problem by using [`functools.wraps`](http://docs.python.org/library/functools.html).


