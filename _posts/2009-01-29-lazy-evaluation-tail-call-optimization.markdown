--- 
layout: default
title: Lazy evaluation & tail call optimization
tags: []

type: regular

---
Recently I read [Debasish's blog](http://debasishg.blogspot.com/2009/01/to-tail-recurse-or-not-part-2-follow-up.html) on how lazy evaluation in Haskell leads to non-obvious impacts on tail recursive functions. I wrote the following code to figure out what actually happens in a non-strict language like Haskell vs a strict language like Erlang.

### With lazy eval (Haskell) ###

<pre><code>
myop :: Int -> Int -> Int
myop a b = 1 + a

test1 :: Int -> [Int] -> Int
test1 acc [] = acc
test1 acc (x:xs) = test1 (acc `myop` x) xs

test2 :: Int -> [Int] -> Int
test2 acc [] = acc
test2 acc (x:xs) = test2 (x `myop` acc) xs
</code></pre>

Both `test1` and `test2` are tail recursive functions. There should be 1 million recursive calls; without TCO we should see some stack overflows. This is what you get when you try to run the above defined Haskell functions:

<pre><code>
*Main> test1 0 [1..1000000]
*** Exception: stack overflow
</code></pre>

<pre><code>
*Main> test2 0 [1..1000000]
1000001
</code></pre>

Haskell (specifically GHC implementation) actually has TCO. In `test1` it should optimize away the tail recursive call. Why then does it run into a stack overflow? The most important thing to realize here is the stack overflow doesn't occur within `test1`. Lazy evaluating test1 leads to the expression **(((0 `myop` 1) `myop` 2) `myop` 3)...** When you force this thunk to be finally evaluated in `myop` (because of the **(+)** in `1+a`), it leads to a bunch of recursive `myop` calls and this is what leads to the stack overflow because that expression is really long (1 million). 

Why does `test2` run fine? Lazy evaluating `test2` leads to the expression **(3 `myop` (2 `myop` (1 `myop` 0)))...** When you force this thunk to be evaluated in `myop`, it conveniently throws away most of the expression and just returns `1 + 1000000 = 1000001`.

### With strict eval (Erlang) ###

<pre><code>
myop(A,_B) -> 1 + A.

test1(Acc, []) -> Acc;
test1(Acc, [H|T]) -> test1(myop(Acc, H), T).

test2(Acc, []) -> Acc;
test2(Acc, [H|T]) -> test2(myop(H, Acc), T).
</code></pre>

<pre><code>
3> tco:test1(0, L).
1000000
4> tco:test2(0, L).
1000001
</code></pre>

In a strict language like Erlang, the arguments are evaluated first and Erlang obviously has TCO. So both `test1` and `test2` run fine and return the expected results.
