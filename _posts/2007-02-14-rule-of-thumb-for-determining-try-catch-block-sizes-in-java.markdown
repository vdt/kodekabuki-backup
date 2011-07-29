--- 
layout: default
title: Rule of thumb for determining try/catch block sizes in Java?
tags: []

type: regular

---
<p>I've been coding in Java for one of the assignments for the <strong>Database Management Systems</strong> course. (For the curious, the assignment is about implementing the heap file layer for the <a href="http://www.cs.wisc.edu/coral/mini_doc/minibase.html">Minibase</a> database). </p> <p><pre lang="java">public boolean doSomething() {
	func1();
	func2();
	func3();
	return true;
}
</pre><br>Consider the above piece of Java code. doSomething() is a method which I need to implement for the assignment. It should return true if it successfully completes the task it is meant to do. Otherwise it should return false. func1(), func2() and func3() throw exceptions - infact each one can throw several exceptions and two functions can throw the same exception as well. If any of the function calls fail, doSomething() should stop executing by returning false to indicate failure. 
<p></p>
<p>The question then is, which of the following two implementations is better when it comes to using try/catch blocks?</p>
<p><strong>Style 1 - Several try/catch blocks</strong><br><pre lang="java">public boolean doSomething() {
	try {
		func1();
	} catch(ExceptionA exa) {
		log("func1 failed", exa);
		return false;
	} catch(ExceptionB exb) {
		log("func1 failed", exb);
		return false;
	}
	try {
		func2();
	} catch(ExceptionA exa) {
		log("func2 failed", exa);
		return false;
	}
	try {
		func3();
	} catch(ExceptionB exb) {
		log("func3 failed", exb);
		return false;
	}
	return true;
}
</pre><br>Style 1 is very cluttered. A quick search on <strong>comp.lang.java.programmer</strong> returns several threads in which people argue that the above style of doing things defeats the purpose of having exceptions in Java&nbsp;because it is very much like C code where you invoke a function and then check for the status (success/failed) code each time before moving on. 
<p></p>
<p><strong>Style 2 - One try/catch for all</strong><pre lang="java">public boolean doSomething() {
	try {
		func1();
		func2();
		func3();
	} catch(Exception ex) {
		log("some func failed", ex);
		return false;
	}
	return true;
}
</pre><br>Style 2 is more elegant and also captures neatly the idea that [func1(), func2(), func3()] form one atomic block and if one of them fails, then the whole thing is considered to have failed. The problem that I have with style 2 is that I cannot determine which of the functions actually raised an exception so that I can log a custom message. Remember that two functions can raise the same exception. 
<p>Any ideas? How do you&nbsp;personally approach try/catch blocks when you code in Java? Is there something simple that I'm missing here (I almost feel so)?</p>
<div class="wlWriterSmartContent" id="0767317B-992E-4b12-91E0-4F059A8CECA8:9c7ef2a1-fc32-4a40-ac4e-9ad7f1ab3e8b" contenteditable="false" style="padding-right: 0px; display: inline; padding-left: 0px; padding-bottom: 0px; margin: 0px; padding-top: 0px">Technorati tags: <a href="http://technorati.com/tags/java" rel="tag">java</a>, <a href="http://technorati.com/tags/exceptions" rel="tag">exceptions</a>, <a href="http://technorati.com/tags/exception%20handling" rel="tag">exception handling</a>, <a href="http://technorati.com/tags/try" rel="tag">try</a>, <a href="http://technorati.com/tags/catch" rel="tag">catch</a>, <a href="http://technorati.com/tags/try-catch" rel="tag">try-catch</a>, <a href="http://technorati.com/tags/error%20handling" rel="tag">error handling</a></div>
