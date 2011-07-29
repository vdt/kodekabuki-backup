--- 
layout: default
title: "simplejson tip: dumping unicode"
tags: []

type: regular

---
[simplejson](http://code.google.com/p/simplejson/) is a popular JSON library for Python. It ships by default with Django too.

Yesterday I was publishing some documents to Solr/Lucene for indexing and one of the fields in the document was supposed to store a JSON string.

So first I tried this:

<pre><code>fieldValue = simplejson.dumps(xyz) # xyz is any JSON-able type
type(fieldValue) # => type 'str'
fieldValueASCII = fieldValue.encode('ascii') # => 'succeeds 100%!'
</code></pre>

By default, `simplejson.dumps()` escapes all unicode characters (ie convert them to \uXXXX format) so that the returned JSON string is just a plain ASCII string. This normally works great. But this was causing problems with Solr (specifically the offsets for the keyword highlights in the search results were off whenever there was a non-ASCII character in front). 

So the solution I came up with was to turn off the simplejson's default behavior of escaping all non-ASCII chars into \uXXXX sequences and just leave them as-is. The reason this is possible is because the JSON spec gives you 2 options when it comes to unicode chars in strings - either escape them or just leave them as-is (JSON text is always UTF-8 encoded btw).

Here are the relevant excerpts from the [JSON RFC4627](http://www.ietf.org/rfc/rfc4627.txt?number=4627):

> All Unicode characters may be placed within the 
> quotation marks...

> Any character may be escaped.  If the character is in the Basic 
> Multilingual Plane (U+0000 through U+FFFF), then it may be
> represented as a six-character sequence: a reverse solidus, followed
> by the lowercase letter u, followed by four hexadecimal digits that
> encode the character's code point.

And the way you accomplish this with simplejson is by passing `ensure_ascii=False` to `dumps()`:

<pre><code>fieldValue = simplejson.dumps(xyz, ensure_ascii=False)
type(fieldValue) # => type 'unicode'
fieldValueASCII = fieldValue.encode('ascii') # => 'might fail!'
</code></pre>

This fixed the incorrect highlighting issue I'd with solr/lucene.

On a side note, I found an [excellent article](http://deron.meranda.us/python/comparing_json_modules/) comparing various Python JSON libraries.
