--- 
layout: default
title: Building a REST API for your iPhone SDK app using plists
tags: []

type: regular

---
I've been writing an iPhone app for Circos over the past few weeks. At Circos we use simple REST APIs to hook up all our components. This way components are completely de-coupled and can be written in whatever language the programmer wants (so far we've used Python, C and Haskell). The idea is very similar to Facebook's Thrift but much simpler. We use JSON as the data-interchange format in these REST APIs.

While developing the iPhone app I couldn't find a good JSON library for Obj-C. After a little bit of searching, I stumbled upon `property lists` or `plists`. Parsing and generating property lists is supported by default in the iPhone SDK. And plist format roughly supports all data types which JSON does. And now the best part - Python already has a nice library to handle plists called `plistlib`. [plistlib](http://gpolo.ath.cx:81/pydoc/library/plistlib.html) ships by default with the Mac distribution of Python. And it is going to be distributed by default for all platforms starting from Python 2.6 onwards.

Here's some sample code to help you get started:

In Python/Django:

<pre><code>  return HTTPResponse(plistlib.writePlistToString(someObj))
</code></pre>

In your iPhone app:

<pre><code>
// make a synchronous HTTP request to your plist API
NSURL *url = [NSURL URLWithString:@"http://localhost:8000/cinepura.plist"]; 
NSURLRequest *request = [NSURLRequest requestWithURL:url];
NSURLResponse *response;
NSError *error;
NSData *plistData;
plistData = [NSURLConnection sendSynchronousRequest:request
                                 returningResponse:&response error:&error];

// parse the HTTP response into a plist
NSPropertyListFormat format;
id plist;
NSString *errorStr;
plist = [NSPropertyListSerialization propertyListFromData:plistData
						mutabilityOption:NSPropertyListImmutable
							        format:&format
						errorDescription:&errorStr];
if(!plist) {
     NSLog(errorStr);
     [error release];
} else {

     // access elements from inside the plist

     NSArray *movies = [plist objectForKey:@"movies"];
     NSLog(@"%@", [movies objectAtIndex:0]);

}
</code></pre>

