--- 
layout: default
title: Running live queries against Hadoop's offline data via Voldemort
tags: []

type: link

---
<a href="http://project-voldemort.com/blog/2009/06/building-a-1-tb-data-cycle-at-linkedin-with-hadoop-and-project-voldemort/">Running live queries against Hadoop's offline data via Voldemort</a>

LinkedIn folks show how they built a simple on-disk format/storage-plugin for their KV-store, Project Voldemort in order to do fast lookups on Hadoop's output data. Huge amounts of output data from Hadoop jobs are converted into this special format via another hadoop job. This data is then dropped straight onto the Voldemort nodes and key-lookups are performed instantly.

I was thinking of building something similar for CouchDB so hadoop jobs can consume docs directly from the CouchDB database files on disk and also spit out data in CouchDB's file format. 
