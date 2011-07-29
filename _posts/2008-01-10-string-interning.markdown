--- 
layout: default
title: String interning
tags: 
- string
- programming
- language
- java
- .net
- clr
- dotnet
- vm
- implementation
- code
type: regular

---
<p>I learnt something new today - "string interning". String interning is the idea of forcing strings with the same contents to share a single buffer in order to save memory. Apparently a lot of VMs including Java and .NET CLR do this. Java automatically interns all string literals and there's an API call (called intern()) for the user to force interning manually on other strings. String interning can only be done when strings are immutable (which they are in Java and .NET). String interning could lead to certain interesting side-effects which are explained <a href="http://javatechniques.com/blog/string-equality-and-interning/">here</a>.</p>

<p>Apparently a lot of design choices can be made while implementing strings in a VM and ROC has a list in his <a href="http://weblogs.mozillazine.org/roc/archives/2008/01/string_theory.html">blog</a>. He's specifically interested in optimizing string operations in Javascript (in Gecko).</p> 
