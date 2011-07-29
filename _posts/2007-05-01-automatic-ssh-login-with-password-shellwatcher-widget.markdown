--- 
layout: default
title: Automatic SSH login with password + ShellWatcher widget
tags: 
- ssh
- mac
- osx
- dashboard
- shell
- automation
- widget
type: regular

---
<p><img src="http://i60.photobucket.com/albums/h35/mallipeddi/shell_widget.jpg"/></p>

<p>I wanted to monitor the processes running on poundbang.in (because for some reason Apache spawned too many of those Flup WSGI-server processes and got my shared account in trouble!). Anyways here's how I'm monitoring the processes:<br>
<ol>
<li>Download and install <a href="http://www.apple.com/downloads/dashboard/networking_security/shellwatcher.html">ShellWatcher Dashboard widget</a>.</li>
<li>Download and install <a href="http://pexpect.sourceforge.net/">pexpect</a> (also includes pxssh - SSH cmd automation library). You need this for automated SSH logins using a password instead of a SSH key.</li>
<li>Make ShellWatcher run the Python program shown below</li>
<li>Done!</li>
</ol>
</p>

<p>
<pre>
#! /usr/local/bin/python
import sys
sys.path.append("/Library/Frameworks/Python.framework/Versions/2.4/lib/python2.4/site-packages")
import pxssh
print "Monitoring process list on poundbang.in"
s = pxssh.pxssh()
if not s.login ('REMOTE_SERVER', 'USERNAME', 'PASSWORD'):
	print "SSH session failed on login."
	print str(s)
else:
	print "SSH session login successful"
	s.sendline ('ps -F U harish')
	s.prompt()	# match the prompt
	print s.before	# print everything before the prompt.
	s.logout()
</pre>
</p>
