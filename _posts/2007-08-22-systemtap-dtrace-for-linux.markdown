--- 
layout: default
title: "SystemTap: DTrace for Linux"
tags: 
- linux
- solaris
- dtrace
- systemtap
- singapore
- eugene teo
- eteo
- redhat
- smu
- slmg
type: regular

---
<p>I attended Singapore Linux Meetup Group (SLMG)'s Aug meetup tonight. Eugene Teo from Redhat Singapore talked about the <a href="http://sourceware.org/systemtap/">SystemTap</a> project. From the SystemTap website,</p> 

<p><strong>
<pre>
SystemTap provides a simple command line interface and scripting language
for writing instrumentation for a live running kernel.
</pre></strong></p>

<p>But to me, SystemTap put simply is "<span style="font-weight: bold;">DTrace for Linux</span>". The project is definitely not as mature as Solaris' DTrace but atleast Linux users don't have to envy Solaris guys anymore (especially with those <a href="http://joyent.com/accelerator/technical-specifications/">Joyent</a> folks rubbing Solaris on our faces once every week!). Currently SystemTap is being developed mostly by Redhat with some help from IBM and a few other Japanese companies.</p>

<p>I'm really more interested in Userspace probes. Because on Solaris with DTrace and a <a href="https://dtrace.joyent.com/projects/ruby-dtrace/wiki/DTrace+enabled+Ruby+1+dot+8+dot+6">custom Ruby interpreter</a> which has <a href="https://dtrace.joyent.com/projects/ruby-dtrace/wiki/Ruby+DTrace+probes+and+arguments">various probes</a> or plug-points defined in it, you can start <a href="http://blogs.sun.com/bmc/entry/dtrace_on_rails">instrumenting</a> your entire web2.0 stack. Even Postgres also has DTrace probes in it that you can tap into if you wanted to. Someone at the meet-up mentioned that the lead developer of Postgres develops Postgres mostly on a Solaris box just for this reason.</p>

<p>Eugene also got SystemTap running on his <a href="http://eugeneteo.livejournal.com/7484.html">Nokia N800</a> and a OLPC (he promised to bring them to the next meetup provided he's in Singapore!). You can find his <span style="font-weight: bold;">SystemTap slides</span> from Redhat Summit 2007 over <a href="http://eugeneteo.livejournal.com/8638.html">here</a>.</p>

<p>Meanwhile on my TODO list: <a href="http://www.quietearth.us/articles/2006/10/26/How-to-compile-systemtap-on-ubuntu">Compiling SystemTap on Ubuntu</a>!</p>
