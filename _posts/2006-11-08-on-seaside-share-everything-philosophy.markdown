--- 
layout: default
title: "On Seaside: \xC3\xA2\xE2\x82\xAC\xC5\x93share everything\xC3\xA2\xE2\x82\xAC\xC2\x9D philosophy"
tags: []

type: regular

---
<blockquote>
    <p><strong><a href="http://www.seaside.st/">Seaside</a>, <a href="http://www.rubyonrails.org/">RubyOnRails</a>, Python <a href="http://www.djangoproject.com/">Django</a>, <a href="http://www.cakephp.org/">CakePHP</a> shares some common idea. But I find only in Seaside the complete and automatic session/request management, and a true MVC process. Why other languages cannot take a similar approach? There are only technical difficulties or there is also some other equally good reason in your own opinion?</strong></p>
    <p align="left">It has very little to do with language. Fundamentally it comes down to a single design decision thatâ€™s at the heart of <strong>Seaside</strong>, which is <strong>to maintain session state in-memory, inside a long-running application server process</strong>. <strong>Thatâ€™s at odds with a traditional â€œshare nothingâ€ philosophy of web development</strong>, which seeks to have all session state be either persistent on the server side (in files or databases), or constantly transmitted from the client in cookies or form fields. By making the choice to â€œshare everythingâ€ and use in- memory session state to its fullest, a lot of the design constraints which have shaped our thinking about web development fall away, and some pretty radically different approaches are possible. Iâ€™d love to see people go down that path in other languages, and thereâ€™s nothing preventing it, but it doesnâ€™t seem to be happening much yet.</p>
</blockquote>
<p>The above is an excerpt from an <a href="http://weeklysqueak.wordpress.com/2006/10/31/ocean-waves-the-applications-built-on-seaside/">interview of Avi Brant</a>, lead developer of the <a href="http://www.seaside.st/">Seaside framework</a> and also the author of a popular web2.0 application called <a href="http://www.dabbledb.com">DabbleDB</a>. DabbleDB is written using the Seaside framework as you might expect!</p>
<p>With a &quot;share everything&quot; philosophy, I wonder how it would be possible to scale up web applications easily to a million users?</p>
<p><small>Tags: <a rel="tag" href="http://technorati.com/tag/seaside">seaside</a>, <a rel="tag" href="http://technorati.com/tag/web2.0">web2.0</a>, <a rel="tag" href="http://technorati.com/tag/framework">framework</a>, <a rel="tag" href="http://technorati.com/tag/dabbledb">dabbledb</a>, <a rel="tag" href="http://technorati.com/tag/smalltalk">smalltalk</a>, <a rel="tag" href="http://technorati.com/tag/share+nothing">share nothing</a>, <a rel="tag" href="http://technorati.com/tag/share+everything">share everything</a></small></p>

