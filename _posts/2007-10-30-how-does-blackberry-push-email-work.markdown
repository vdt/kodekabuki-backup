--- 
layout: default
title: How does BlackBerry Push Email work?
tags: 
- push
- email
- blackberry
- direct push
- microsoft
- rim
type: regular

---
<p>My dad recently asked me as to what's special about the Blackberry push-email service. I didn't really have an answer back then. I was researching a bit about it tonight and finally came across a series of nice articles by a Singaporean blogger Paul Mah describing push-email and comparing BlackBerry Push with MSFT's relatively new Direct Push technology.
</p><ul><li><a href="http://www.techatplay.com/2006/11/20/definition-of-push-mail/">What is push-email?</a></li><li><a href="http://www.techatplay.com/2006/10/18/how-does-direct-push-really-work/">How Microsoft's Direct Push works?</a></li><li>Research on <a href="http://www.techatplay.com/2006/11/28/which-uses-less-traffic-blackberry-push-or-microsoft-direct-push/">traffic consumption</a> in BlackBerry Push vs Microsoft Direct Push</li></ul>

<p>Basically the way it works is your BlackBerry device connects to a NOC (specific to your carrier) for notifications. Then you need a licensed copy of BlackBerry Enterprise Server (BES) which you can run on a typical x86 server back at your office (apparently it can even be run inside VMWare). The BES connects to your mail server and listens for new email in your Inbox and at the same time it also maintains a connection to the NOC. When it notices new email in your Inbox in your email server, it sends a notification which travels via the NOC to the BlackBerry device. Apparently it uses UDP for all this traffic.</p>

<p>Direct Push on the other hand is extremely simpler. It is very similar to IMAP-IDLE on your computer. The device maintains a persistent TCP connection directly to the MS Exchange server.</p>

<p>From what I've read in the articles above, it seems to me like if you want BlackBerry Push mail service, just owning a BlackBerry device (or any other device which has the BlackBerry Connect software installed) is not enough. You need a mobile carrier who has a tie-up with BlackBerry to run a regional NOC (to understand this term, you need to visit the links above). And you're also probably stuck with a few BlackBerry-specific price plans from that carrier.</p>

<p>Actually what's interesting is what Paul mentions in one of those articles - in Singapore it is cheaper to get a normal 3G data plan and use something like Direct Push instead of subscribing to the more expensive BlackBerry-specific plans even though BlackBerry Push typically consumes less bandwidth because it is more efficient. This is probably because the local carrier has to pay RIM for operating the NOC for its customers.</p>
