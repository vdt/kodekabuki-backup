--- 
layout: default
title: What does thread-safety really mean?
tags: 
- thread
- parallel
- processing
- programming
- software
type: regular

---
<p>I finally found a good explanation of what <b>thread safety</b> really means over <a href="http://mail-archives.apache.org/mod_mbox/xerces-general/200003.mbox/%3CEB55BCC162CAD111BD0A00A0C9979E32027E1E4C@cvo1.cvo.roguewave.com%3E">here</a>:</p>
<p>
<pre>
This is generally a tricky subject - claiming a
component/class/lib/package/whatever is "thread-safe" usually causes a bit
of confusion without further definition of what "thread-safe" means.  At
Rogue Wave, we use four different categories of thread-awareness to describe
C++ code.

A) Single Thread - no synchronization whatsoever, therefore no overhead but
shame on you if (or more probably, when) you use it in an MT app and it core
dumps

B) Level 1 Thread Safe - lib/class can be safely and sanely used in an MT
app.  Safety basically means all access to global data (i.e., static class
vars in C++) is protected with adequate synchronization "behind the scenes".
Sanely is a bit trickier - it means that any "hidden" tricks used at the
class level (like caching, copy-on-write, etc.) do not cause unexpected
behavior when multiple objects share hidden non-static resources, and it
also means that common sequences of operations on a class will work
predictably and consistently in both ST or MT code (normally static
resources which affect behavior may need to be per-thread, instead of
singletons).   All this does NOT imply instance level safety, i.e. thread 1
can work with Foo a while thread 2 works with Foo b with complete safety,
but if both threads want to access Foo a then they must synchronize around a
mutex or some other threading gadget to ensure that only one thread works
with the instance at a time.

C) Level 2 Thread Safe - all of Level 1 + instance level safety - L2 objects
synchronize themselves.  Therefore if class Foo is L2 thread safe, I can use
Foo b in multiple threads at once without worrying about it, because b will
synchronize itself, i.e. all the thread safety is in the methods of Foo
(usually locking a mutex which is a private or protected member of Foo).
This is really nice, easy, and convenient for simple stuff, but it has
drawbacks similar to pessimistic locking on a database.  First, performance
takes a major hit, because you are ALWAYS locking, even if only one thread
"sees" the object.  Second, you can get backed into some very ugly deadlock
corners if you're not careful (it makes it easy enough for you to get to the
harder problems sooner...).

D) Thread Hot - the class is L1 or L2 thread safe, and it can create and
manage new threads behind the scenes to do work on your behalf (for example,
an FTP client class which will create a background thread to run the FTP
transfer instead of taking over the calling thread for the entire period).
</pre>
</p>
 <p>You might also want to read Wikipedia's take on <a href="http://en.wikipedia.org/wiki/Thread-safety">this subject</a>.</p>
