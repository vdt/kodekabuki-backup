--- 
layout: default
title: MySQL TechTalk @ Facebook
tags: []

type: regular

---
<object width="560" height="340" id="lsplayer" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"><param name="movie" value="http://cdn.livestream.com/grid/LSPlayer.swf?channel=facebookevents&amp;clip=flv_cc08bf93-7013-41e3-81c9-bfc906ef8442&amp;color=0xe7e7e7&amp;autoPlay=false&amp;mute=false&amp;iconColorOver=0x888888&amp;iconColor=0x777777"></param><param name="allowScriptAccess" value="always"></param><param name="allowFullScreen" value="true"></param><embed name="lsplayer" wmode="transparent" src="http://cdn.livestream.com/grid/LSPlayer.swf?channel=facebookevents&amp;clip=flv_cc08bf93-7013-41e3-81c9-bfc906ef8442&amp;color=0xe7e7e7&amp;autoPlay=false&amp;mute=false&amp;iconColorOver=0x888888&amp;iconColor=0x777777" width="560" height="340" allowScriptAccess="always" allowFullScreen="true" type="application/x-shockwave-flash"></embed></object><div style="font-size: 11px;padding-top:10px;text-align:center;width:560px">Watch <a href="http://www.livestream.com/?utm_source=lsplayer&amp;utm_medium=embed&amp;utm_campaign=footerlinks" title="live streaming video">live streaming video</a> from <a href="http://www.livestream.com/facebookevents?utm_source=lsplayer&amp;utm_medium=embed&amp;utm_campaign=footerlinks" title="Watch facebookevents at livestream.com">facebookevents</a> at livestream.com</div>

I found this recording of a talk that Facebook hosted recently. Their MySQL team presents a bunch of interesting projects they've worked on at Facebook. I've been doing a lot of MySQL-related projects at [work](http://www.zumodrive.com) as well.

There's an interesting section where one of the engineers mentions about his 'non-stored procedures' as he calls it - he reveals their entire relationship graph is actually stored pretty much in MySQL tables but just heavily sharded and they seem to have gotten it to work well. It looks like majority of their data lives in MySQL - Cassandra usage is pretty minimal.

What happens when replication delay becomes very high across a WAN link? After it crosses a certain threshold, they actually start forwarding DB requests to the datacenter which has the master DB until replication catches up. They also mentioned they're working on Master-Master replication with conflict detection, so they can have masters in multiple datacenters.

[Flashcache](http://www.facebook.com/note.php?note_id=388112370932) hasn't been put into production yet - still experimental.

MySQL tools:

Facebook seems to be using Percona's XtraDB and that makes binary backups easy. We opted to use LVM snapshots on a slave at [work](http://www.zumodrive.com).

  * Percona's [maatkit](http://www.maatkit.org/doc/) - useful set of command-line utils
  * Percona's aspersa - set of Perl scripts for debugging MySQL; ioprofiler is useful
  * [innotop](http://innotop.sourceforge.net/)
  * [qpress](http://www.quicklz.com/) - QuickLZ compression for transferring MySQL dumps; supposedly faster than LZO also.

