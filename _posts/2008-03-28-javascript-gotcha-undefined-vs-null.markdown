--- 
layout: default
title: Javascript gotcha - undefined vs null
tags: []

type: regular

---
I always get confused over when to use what. So for my own reference (and possibly others), here's an explanation:

* `undefined` is a special value whose type is also `undefined` 
* `null` is a special object and hence its type is `object`
* When a variable has no value assigned to it yet, its type is `undefined`
* When an property is not defined on an object, that property is `undefined`
* A variable can be explicitly set to `null` and then the type of that variable will be `object`

### More examples ###

    5 == 5; // true
    undefined == undefined; // true
    typeof 5 == "number"; // true
    typeof undefined == "undefined"; // true
    typeof nada == "undefined"; // true
    typeof window.doesnotexist == "undefined"; // true 
    window.doesnotexist == null; // true
    window.doesnotexist === undefined; // true
    window.doesnotexist === null; // false
    null == null; // true
    typeof null == "object"; // true
    null == undefined; // true
    null === undefined; // false
    !null && !undefined; // true

### What to test for in if expressions? ###

> If you just want to know if "x" is true-ish, use
> if (x) { }
> 
> If you want to know if it's false-y, use
> if (!x) { }
> 
> (x == null) only tests if x is falsey, since (false == 0) and ('' == false) and (undefined == null). 
> 
> If you're going to bother writing out (x == true), then it must matter that x is boolean "true" and not 1 or "asdf" or [1,2,3], so you should use ===. If it doesn't matter, then skip the "== true" to make it clearer.
> 
> undefined and null are oddballs, since they're false-y but != false. 
> (null == undefined) but (null !== undefined).
>
> [Original Source](http://www.thescripts.com/forum/post2365415-5.html)

Do you've any other rule-of-thumbs that you follow related to this?
