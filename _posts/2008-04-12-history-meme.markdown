--- 
layout: default
title: History meme
tags: []

type: regular

---
Since [everyone](http://planet.gnome.org)'s doing it, here's mine:

    [~]$ history|awk '{print $2}'|sort|uniq -c|sort -rn|head
     112 ls
     73 cd
     65 ./hadoop-admin.py
     59 $HADOOP_HOME/bin/hadoop
     22 ant
     21 ssh
     18 ./admin.py
     12 /Users/harish/Code/Java/hadoop-0.16.0/bin/hadoop
     11 scp
     11 exit

As you can tell, I've been working with [hadoop](http://hadoop.apache.org/core/) a lot at [work](http://www.circos.com).
