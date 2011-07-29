--- 
layout: default
title: In object-oriented languages such as C++, if class B is a subtype of class A, then al...
tags: []

type: quote

---
> In object-oriented languages such as C++, if class B is a subtype of class A, then all member functions of B must return the same or narrower set of types as A; the return type is said to be covariant. On the other hand, the member functions of B must take the same or broader set of arguments compared with the member functions of A; the argument type is said to be contravariant. The problem for instances of B is how to be perfectly substitutable for instances of A. The only way to guarantee type safety and substitutability is to be equally or more liberal than A on inputs, and to be equally or more strict than A on outputs.

<a href="http://en.wikipedia.org/wiki/Covariance_and_contravariance_(computer_science)">Covariance and contravariance (computer science) - Wikipedia, the free encyclopedia</a>

Just found out about these concepts of covariance, contravariance and invariance in the type system of a language after watching an [interview](http://channel9.msdn.com/shows/Going+Deep/Expert-to-Expert-Anders-Hejlsberg-The-Future-of-C/) of Erik Meijer and Anders Hejlsberg talking about C#4.0. Apparently so far both Java and C# break type safety because arrays of reference types are covariant in both languages. There's an example of how this can be done in the wikipedia page.

**Update:** I wrote the following Java program to demonstrate these concepts:

<script src="http://gist.github.com/74274.js"></script>
