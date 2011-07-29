--- 
layout: default
title: Building your programming language arsenal
tags: []

type: regular

---
It's almost the end of 2008 and I spent the rainy afternoon playing with [Factor][factor]. I then went into this sort of a flashback mode thinking about what each programming language has taught me so far and what I should be learning next year. So this post will literally be a dump of that train of thought albeit re-organized a bit for sanity.

**[ <2003 ] - BASIC, C**

I didn't really appreciate the languages I was using because I lacked the necessary background. It was just a means-to-an-end. Using GOTO statements didn't really make me hate myself :)

*Takeaways - basic control flow constructs, pointers/memory-management.*

**[ 2003 - 2004 ] - Java - OOP**

This was during my first 2 years in the university. Java was the de-facto teaching language back at my [university](http://www.comp.nus.edu.sg) for all the introductory freshmen courses. There was actually a special Scheme-based introductory programming class but I chickened out. Looking back, this seems like a good decision. If I were given a taste of functional programming right from the beginning I would have never ended up learning anything about object-oriented programming and struggled later in other courses and out in the work environment. 

*Takeaways - static typing, encapsulation, inheritance, polymorphism, garbage collection, exceptions.*

**[ 2005 - 2006 ] - Python - first foray into "dynamic programming"**

I was back in Bangalore, India during the summer break and was bored. Bookshops in Bangalore are full of programming books (fodder for the local IT outsourcing industry) and books are generally significantly cheaper than elsewhere. I wanted to learn a scripting language; took a look at a Perl book and instantly realized I cannot stand that horrible syntax. PHP with its ability to have inline markup and the lack of namespaces just seemed nasty (earlier I developed an auction system in PHP for an introductory database class and hated it). I hadn't heard about Ruby by then. And I stumbled upon Python.

*Takeaways - dynamic programming, duck typing, generators, significance of syntactic sugar (lists, dictionaries, list comprehensions), lambda expressions,  multi-inheritance, metaclasses*

**[ 2007 ] - Javascript**

This is roughly when I caught the web2.0 fever; I could smell AJAX in the air everywhere! I ended up interning for a [travel search engine startup](http://www.wego.com) in the summer mostly writing JS of course. 

*Takeaways - beauty of `closures`, prototypal inheritance* 

**[ 2008 ] - Erlang & Obj-C**

Learnt Erlang purely because of the hype surrounding it on [reddit](http://programming.reddit.com) which turned out to be an excellent decision in hindsight. I'm starting to use it in real production environments already and love it.

*Takeaways - functional programming, pattern matching, message passing, single-assignment*

I picked up Obj-C when I had to write an iPhone app few months back. Obj-C is kind of interesting because I could never manage to draw a clear line between the language and the framework (Cocoa). They seem too tightly knit to me. Obj-C is the first language that I have encountered which has a mix of static & dynamic typing (ECMAScript is going to get adopt the same in the latest version). 

Also interesting is the heavy use of (in)formal `protocols` - you implement a bunch of methods in your `delegate` and pass that along to someone else. Formal protocols are similar to Java's interfaces. I think this is largely due to Obj-C being mainly meant for writing graphical desktop apps. Writing code for a GUI typically involves event/callback-driven programming. The main thread manages the UI and invokes your code when certain events happen. Also interesting are `categories` - they let you extend existing classes (even core classes from the standard libraries) without sub-classing them. So even something as basic as NSString is open for extension (kind of like Ruby's open classes). You can only add new methods or override methods but cannot add new instance variables.

*Takeaways - SmallTalk-style message passing (and amusing selector syntax), mixing static/dynamic typing, (in)formal protocols, categories, reference-counting based memory management (Obj-C 2.0 has garbage collection but not supported on the iPhone)*

**Goals for 2009 - Factor & Clojure**

I always wanted to learn a Lisp properly (esp after chickening out from learning Scheme as a freshman!). Clojure seems like the most attractive Lisp to learn right now (because of its ability to run on the JVM and access to all the existing Java libraries). After Erlang's message-passing, Clojure's STM is likely to give a very different programming experience.

I came across [Factor][factor] a few weeks back when its creator, Slava Pestov gave a [TechTalk](http://www.youtube.com/watch?v=f_0QlhYlS8g) at Google. It seems to be inspired by Forth and is quite new. It belongs to the family of `concatenative languages`. It uses a stack instead of named variables to manage data flow. 

I also considered Haskell and SmallTalk (Squeak). Haskell is probably one of those few languages which will let you write 100% `side-effect free` functional code (or more correctly use monads to keep your referentially transparent code separate from side-effect prone code). I'd a coworker Kenny at my previous job who's a Haskell expert and built everything in Haskell. Haskell seems very academic to me and I don't exactly long for static typing :)

If you pick the right languages, you'll learn something new and have fun in the process. Also it'll probably take you years before you become a master in any of these languages (as [Peter Norvig says](http://norvig.com/21-days.html)). The point of this exercise should not be to garble lots of language syntaxes and be overwhelmed. The key is to identify the core concepts and grasp the essence of a language.

So what languages are you planning to pick up in 2009?

[factor]: http://factorcode.org/faq.fhtml
