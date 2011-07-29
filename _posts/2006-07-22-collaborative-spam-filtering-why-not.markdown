--- 
layout: default
title: "Collaborative spam filtering: why not?"
tags: []

type: regular

---
<p>I just watched this video recording of a talk titled &quot;<a href="http://video.google.com/videoplay?docid=-985396858578246176&q=engedu">Turning Email Upside Down</a>&quot; at Google Techtalks by two guys who proposed a RSS-type pull email system instead of the current SMTP-based push system inorder to overcome the spam problem. I have heard this idea a lot of times before.</p>
<p>There are two big problems with this pull approach:</p>
<ul>
    <li>the &quot;first contact&quot; problem.</li>
    <li>pull-based systems are very inefficient in terms of bandwidth consumed because there is constant polling going on. </li>
</ul>
<p><strong>The &quot;first contact&quot; problem</strong></p>
<p>One of the most useful features of email is that anyone can send someone a message without having prior contact. Ignoring this is a big mistake!</p>
<p><strong>Inefficiency of &quot;polling&quot;</strong></p>
<p>With most desktop-based email clients by default being setup to ping the mail server every 5 minutes, I cannot imagine what will happen to the mail traffic on the internet with their proposed solution. With the system that they proposed, this constant polling is not going to be restricted between just a client and its mail server but it is going to spill over the whole web as the client goes on polling the mail servers of all the people on the client's address book. Frankly neither is RSS such an efficient solution.</p>
<p>Further the problem is elevated in this situation (as pointed by someone in the audience) - &quot;the number of good healthy people checking their email is a lot higher than the no. of evil spammers + zombies trying to send mail&quot;. This would result in lot of unnecessary email polling traffic because now the receipients are the more proactive people.</p>
<p><strong>Other proposed solutions to the spam problem [read: stupid solutions that will never be practical]</strong></p>
<ul>
    <li>Charging a micro-amount for every email sent by someone and reimbursing that someone with the same micro-amount for every email that he receives.</li>
    <li>Artificially injecting high CPU usage for the task of sending mail (by making the client do some computation before its email is accepted!).</li>
</ul>
<p><strong>Current working solution</strong></p>
<p>The current popular solution to the problem is ofcourse the &quot;keyword-based statistical spam assasins&quot;. They're very good at identifying regular spam which contain the popular (infact horribly over-used) keywords in them like viagra. But every now and then you find these new messages which are infact spam but still escape through the checks of the spam-assasin largely because they did not contain any of the keywords which the spam-assasin was looking for.</p>
<p>A lot of webmail service providers including GMail, Yahoo Mail, and Hotmail use these kind of spam detectors. Yahoo Mail by far has the worst implementation among the three because even after flagging a message from a particular sender as spam, it still refuses to identify messages from the same email id as spam subsequently. Hotmail also sucks a bit because it seems to have a very high false positive rate. GMail seems to be the best so far. But still all the three do keep making mistakes all the time.</p>
<p><strong>My take on the whole issue - &quot;build digg.com style collaborative spam filtering engines&quot;</strong></p>
<p>After looking at the success of digg.com and the whole idea of collaborative content filtering systems, I came up with this idea. If you think about it, what digg.com is doing is to let people flag a story as &quot;interesting&quot; or &quot;not interesting&quot;. And once a certain no. of people flag it as interesting, it is considered to be homepage worthy and moved to the homepage thereby saving the time for the rest of the people in the community by giving them filtered content which only contains the most interesting stuff (interesting as-in found interesting by a decent sized group of people).</p>
<p>I think the same idea can be extended to filtering spam. The reason I think it will work is because spam has certain beautiful properties that can be exploited:</p>
<ul>
    <li><strong>With most spam the general content or the template is fixed, but it is sent to a lot of people (the process that is normally referred to as mail-merging).</strong></li>
    <li><strong>If something is spam to me, there's a very high chance that it will probably be spam to you too.</strong></li>
</ul>
<p>Agreeing upon the above two observed trends (which I think are very reasonable assumptions to make), all that we have to do to eliminate spam is to let people to collaboratively flag a message as spam and then share the fruits of their collaborative efforts. </p>
<p><strong>For this to work, ofcourse there has to be a sufficiently large community participating in the task of filtering spam much like how digg.com needs a sufficiently large userbase to be successful</strong>. I would probably say that <strong>big email service providers like Hotmail, GMail and Yahoo! Mail, already have this critical mass</strong>. The rationale behind this is that if I receive a particular spam message (ignore the fact that spam is plural) in my GMail account, then it is highly likely that someone else also received the same email in his GMail account and so did a hundred other people. And if 10 of us flag it as spam, then the efforts of the first 10 people, can immediately bear fruit in helping the rest of the 90 from having to begin their day by reading that irritating spam message.</p>
<p>Ofcourse the system will work better if more number of people participate in it. If this has to happen, then the mail servers all over the internet, need to agree upon some kind of protocol to propagate these &quot;spam flagging&quot; efforts of their clients. I think this is very feasible. Most of the existing spam assasins actually have an in-built mechanism to update their keywords list, and also to sync their blacklisted email records with each other. All that I'm proposing is to take it a bit deeper and id every single email being sent and received in the global email space for a specific time frame. </p>
<p>Most importantly this is the only solution that has the least effect on the whole email experience both on the client side and the server side. <strong>There need not be any new protocols from IETF. Clients do not have to be re-written. All that is necessary is a spam assasin plugin for the existing mail servers which is capable of collaborating with other instances of it running on neighbouring servers (the propagation stuff probably needs to be implemented in a P2P manner).</strong></p>
<p><small>Tags: <a rel="tag" href="http://technorati.com/tag/spam">spam</a>, <a rel="tag" href="http://technorati.com/tag/detection">detection</a>, <a rel="tag" href="http://technorati.com/tag/email">email</a>, <a rel="tag" href="http://technorati.com/tag/rss">rss</a>, <a rel="tag" href="http://technorati.com/tag/smtp">smtp</a>, <a rel="tag" href="http://technorati.com/tag/pop">pop</a></small></p>
<p align="right"><small><em>Powered by</em> <a href="http://www.qumana.com/">Qumana</a></small></p>

