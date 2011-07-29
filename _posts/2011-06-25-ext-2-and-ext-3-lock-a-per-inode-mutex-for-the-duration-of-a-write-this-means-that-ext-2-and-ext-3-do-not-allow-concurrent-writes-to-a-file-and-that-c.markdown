--- 
layout: default
title: ext-2 and ext-3 lock a per-inode mutex for the duration of a write. This means that e...
tags: []

type: quote

---
> ext-2 and ext-3 lock a per-inode mutex for the duration of a write. This means that ext-2 and ext-3 do not allow concurrent writes to a file and that can prevent you from getting the write throughput you expect when you stripe a file over several disks with RAID. XFS does not do this which is one of the reasons many people prefer XFS for InnoDB.

<a href="https://www.facebook.com/note.php?note_id=10150210901610933">XFS, ext and per-inode mutexes</a>

I didn't know this. So if you're using InnoDB with O_DIRECT on a server with RAID, you'd really be well off using XFS. I'm guessing if you don't use O_DIRECT, your writes just end up getting cached in the buffer cache, and the write throughout issue won't be pronounced. Domas made a [benchmark](http://dom.as/2008/08/11/notes-from-land-of-io/) to test this behavior.
