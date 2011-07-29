--- 
layout: default
title: In a functional programming language like Haskell the calls to self and now would be ...
tags: []

type: quote

---
> In a functional programming language like Haskell the calls to self and now would be delayed until the value of the arguments were needed within maketuple. This means self or now could start after the call to maketuple, finish before it, or possibly never be evaluated. This is called lazy evaluation. Function arguments in Erlang however are strictly evaluated, meaning self and now are evaluated before maketuple.

<a href="http://notdennisbyrne.blogspot.com/2008/04/sequence-and-order-in-erlang.html">Not Dennis Byrne: Sequence and Order in Erlang</a>

Erlang trivia
