--- 
layout: default
title: Presentation on Google's Internal innovations by an outsider
tags: []

type: regular

---
<p><a href="http://cbcg.net/talks/googleinternals/index.html">Google Internals</a></p>

<p>[Note: The presenter is not from Google. He works for <a href="http://www.turntide.com/router/">Turntide</a> (now part of Symantec)]<br/>
</p>

<p>Topics touched:</p>

<p>1. Google File System<br/>
</p>

<p>2. WorkQueue</p>

<p>3. MapReduce</p>

<p>4. Sawzall</p>

<p>5. BigTable</p>

<p>Sawzall is essentially a statically typed language built on top of MapReduce and helps Google engineers to write really small scripts to launch massively parallel jobs without thinking too much about how to parallelize the jobs at hand. The caveat is that the task (lets just assume a huge job can be split into many small tasks) need to be commutative and associative which means that they're inherently very suitable for running parallel on thousands of machines in any order you want. Moreover if some machine fails, it doesn't affect the rest of the tasks; the failed task just needs to be reassigned to some other good machine. You can find out more about Sawzall by reading <a href="http://labs.google.com/papers/sawzall.html">this paper</a> from Google Labs. <br/>
</p>

<p/><!-- technorati tags begin --><p style="font-size:10px;text-align:right;">technorati tags:<a href="http://technorati.com/tag/google" rel="tag">google</a>, <a href="http://technorati.com/tag/gfs" rel="tag">gfs</a>, <a href="http://technorati.com/tag/filesystem" rel="tag">filesystem</a>, <a href="http://technorati.com/tag/internals" rel="tag">internals</a>, <a href="http://technorati.com/tag/workqueue" rel="tag">workqueue</a>, <a href="http://technorati.com/tag/mapreduce" rel="tag">mapreduce</a>, <a href="http://technorati.com/tag/talk" rel="tag">talk</a>, <a href="http://technorati.com/tag/presentation" rel="tag">presentation</a>, <a href="http://technorati.com/tag/sawzall" rel="tag">sawzall</a>, <a href="http://technorati.com/tag/bigtable" rel="tag">bigtable</a></p><!-- technorati tags end --><p style="text-align: right; font-size: 8px">Blogged with <a href="http://www.flock.com" title="Flock" target="_new">Flock</a></p>
