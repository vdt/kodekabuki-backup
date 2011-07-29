--- 
layout: default
title: Since the per-query parser object now stores all memcache keys we tack on to a query,...
tags: []

type: quote

---
> Since the per-query parser object now stores all memcache keys we tack on to a query, we added a small piece of code at the end of mysql_execute_command that dirties those keys if the query is successful. Voila, we've hijacked the MySQL replication stream for our own purpose: cache consistency.

<a href="http://www.new.facebook.com/notes.php?id=9445547199">Facebook | Engineering @ Facebook's Notes</a>

In brief: They modified MySQL such that additional user-defined info (in this case the list of keys to purge from memcached) can be transported to the slaves by hijacking the master-slave replication stream.
