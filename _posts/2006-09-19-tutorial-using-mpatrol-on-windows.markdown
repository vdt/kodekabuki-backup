--- 
layout: default
title: "Tutorial: Using Mpatrol on Windows"
tags: []

type: regular

---
<p>This semester I'm writing a simple static program analysis tool in C++ for a <a href="http://www.comp.nus.edu.sg/~cs3215/">software engineering course</a>. I was looking for a nice memory profiler tool for Windows and realised that nothing like <a href="http://valgrind.org/">Valgrind </a>exists for Windows. IBM/Rational's <a href="http://www-306.ibm.com/software/awdtools/purifyplus/">PurifyPlus</a> seems to be good but it is commercial. The best tool that I can find until now is mpatrol. One of the main features that I needed out of the tool was to do simple memory leak detection at runtime. </p>
<p><a href="http://www.cbmamiga.demon.co.uk/mpatrol/">mpatrol</a> provides libraries that you can link to and the executable that is produced after linking to the mpatrol library is capable of outputting log files showing the results from the memory profiler.</p>
<p>The instructions for using mpatrol in Microsoft VC++ 6.0 (but the steps should be very similar in any IDE) are below. This tutorial is based mostly on <a href="http://www.codeguru.com/cpp/w-p/win32/tutorials/article.php/c12231/">this other nice tutoria</a>l that I found.</p>
<p><strong>Installation</strong></p>
<p>1. There do not seem to be any win32 binaries available from mpatrol's website. <a href="http://www.comp.nus.edu.sg/~malliped/mpatrol.zip">Download</a> the win32 binaries (my school's server).</p>
<p>2. Unzip the contents to any folder you want. The zip file contains two folders: mpatrol/ contains the binaries (.dll) and include/ contains the necessary header files from the mpatrol source.</p>
<p>3. Copy the .dll files from the folder to your Windows System folder (c:\windows\system32\).</p>
<p>4. Open your VC++ project inside Microsoft Visual Studio. Create a new configuration by copying the settings from the Debug configuration (give it a meaningful name like &quot;Debug - MPatrol&quot;). </p>
<p>5. In &quot;Project Settings-&gt;Link-&gt;Category:General&quot;, add path/to/mpatrol.lib to the Object/Library modules list.</p>
<p>6. In &quot;Project Settings-&gt;Link-&gt;Category:Input&quot;, add path/to/mpatrol.lib to the list again. Also add the path/to/mpatrol/include folder in the &quot;Additional Library Path&quot; section.</p>
<p>7. Rebuild all under the new configuration.</p>
<p>8. Use the resulting executable (.exe) with one of the mpatrol tools (exe files) to generate the log files!</p>
<p><small>Tags: <a rel="tag" href="http://technorati.com/tag/mpatrol">mpatrol</a>, <a rel="tag" href="http://technorati.com/tag/memory+leak">memory leak</a>, <a rel="tag" href="http://technorati.com/tag/memory">memory</a>, <a rel="tag" href="http://technorati.com/tag/bugs">bugs</a>, <a rel="tag" href="http://technorati.com/tag/c%2B%2B">c++</a>, <a rel="tag" href="http://technorati.com/tag/valgrind">valgrind</a>, <a rel="tag" href="http://technorati.com/tag/windows">windows</a>, <a rel="tag" href="http://technorati.com/tag/profiling">profiling</a></small></p>
<p style="color:#008;text-align:right;"><small><em>Powered by</em> <a href="http://www.qumana.com/">Qumana</a></small></p>

