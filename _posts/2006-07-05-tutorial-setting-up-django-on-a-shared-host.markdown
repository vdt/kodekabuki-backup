--- 
layout: default
title: "Tutorial : Setting up Django on a shared host"
tags: 
- django
- tutorial
- shared hosting
- deployment
- fastcgi
- flup
- asmallorange
- tutorial
type: regular

---
<p>In this tutorial, I will walk you through the process of installing <a title="Django Web Framework" target="_blank" href="http://www.djangoproject.com/">Django</a> on a shared host.</p>

<p>Before we proceed any further, I would like to mention a few things first:
<ul>
	<li>The instructions I provide over here work well for my hosting space provider - <a title="A Small Orange" target="_blank" href="http://www.asmallorange.com/">A Small Orange</a>. But you may need to adapt a few things here and there to suit your setup which may vary from hosting service provider to provider.</li>
	<li>There are two popular ways of deploying Django :-
        <ol>
	<li>Apache/mod_python/Django</li>
	<li>Apache/mod_fcgi/Flup/Django</li>
        </ol>
If your hosting space provider does not support mod_python (like mine), then you need to choose the second option. As you might imagine, in this tutorial I'm going to restrict myself to describing the second way of deploying Django. If you want to use mod_python, please refer to some other tutorial online.</li>
</ul>
<p><strong>Installation</strong>
<ol>
<li>
Get the latest version of Django from SVN
<div align="left">
<pre lang="bash">
cd ~
svn co http://code.djangoproject.com/svn/django/trunk/ django_src 
</pre>
</div>
</li>
<li>
Edit your PATH and PYTHONPATH environment variables
<pre lang="bash">
export PATH=$PATH:$HOME/django_src/django/bin
export PYTHONPATH =$PYTHONPATH:$HOME/django_src:$HOME/django_projects
</pre>
</li>
<li>
Create a directory for your Django projects and create your first project
<pre lang="bash">
mkdir django_projects
cd django_projects
django-admin.py startproject myproject 
</pre>
</li>
<li>
Change the user permissions on the project settings file (this is to prevent others on the shared host from looking at your settings file which happens to include the database password in plain text)
<pre lang="bash">
chmod 600 myproject/settings.py 
</pre>
</li>
<li>
Add your database information to the project settings file (If you're using ASO, they normally do not have the MySQLdb python module which Django needs in order to talk to the MySql database. Post a ticket and someone will install it for you!).
</li>
<li>
Install <a title="flup wsgi server opensource project" target="_blank" href="http://www.saddi.com/software/flup/">Flup</a>. Flup includes a WSGI server which can speak FastCGI and is implemented in Python. Grab the latest snapshot of Flup from <a target="_blank" href="http://www.saddi.com/software/flup/dist/">here</a>. Remember to include Flup folder in your PYTHONPATH as we'll be using it in the next step. To check if Flup is properly installed, get into the Python shell, and try importing flup module.
</li>
<li>
Now create a publicly accessible folder under your web root (~/www/ or ~/public_html/) for your new Django project.
<pre lang="bash">
mkdir ~/www/myproject
</pre>
</li>
<li>
Add this file called django.fcgi to the folder created above (You can call it anything you want. But the file needs to have the .fcgi extension for Apache to handle it properly)
<pre lang="python">
#!/usr/bin/env python2.4
import sys, os

# your custom PYTHONPATH entries go here:
sys.path.append('/home/harish/django_src')
sys.path.append('/home/harish/django_projects')
sys.path.append('/home/harish/flup-r2016')
sys.path.append('/home/harish/apps')

# your settings module goes here:
os.environ['DJANGO_SETTINGS_MODULE'] = 'myproject.settings'

# invoke FastCGI server (using Django's flup wrapper)
from django.core.servers.fastcgi import runfastcgi
runfastcgi(method="threaded", daemonize="false")
</pre>
You have to edit the sys.path setting in the above code according to your server setup!
</li>
<li>
Make the file django.fcgi executable.
<pre lang="bash">
chmod 755 django.fcgi
</pre>
</li>
<li>
Now you're good to go. Point your browser at <strong>http://www.yourdomain.com/myproject/django.fcgi/</strong> and you should be able to see the default Django "Congratulations!" page.<br/>

<li>Proceed to create a new app in your myproject folder - follow the instructions at the Django Project Documentation site.
</li>
</ol>
</p>

<p>
<strong>Other useful links:</strong>
<ul>
	<li><a title="a small orange support forum" target="_blank" href="http://forums.asmallorange.com/">A Small Orange Support Forums</a></li>
	<li><a title="django friendly web hosts" target="_blank" href="http://code.djangoproject.com/wiki/DjangoFriendlyWebHosts">List of Django Friendly Web Hosts</a></li>
	<li><a title="aso support forum django" target="_blank" href="http://forums.asmallorange.com/index.php?showtopic=5104&hl=django">Original thread at the ASO support forums</a> based on which this tutorial has been written.</li>
	<li><a title="django doc" target="_blank" href="http://www.djangoproject.com/documentation/fastcgi/">Django Documentation page on FastCGI configuration.</a></li>
</ul></p>

<p><b>Updated :</b> Modified step 8 (django.fcgi) to make it much cleaner.</p>
