--- 
layout: default
title: Why is REST named so cryptically?
tags: []

type: regular

---
This afternoon I read a [couple](http://www.infoq.com/articles/mark-baker-hypermedia) of [articles](http://www.infoq.com/articles/subbu-allamaraju-rest) on RESTful APIs recommended by Bill de hora in his blogpost titled [Snowflake APIs](http://www.dehora.net/journal/2009/01/09/snowflake-apis/) in which he speculates the future of data APIs. Before reading them my understanding of REST was that any API was RESTful as long as it had resources exposed at unique URIs through multiple representations (JSON, XML, etc) and operations could be performed on these resources via the four HTTP methods - GET, PUT, POST and DELETE. I'm finally grokking what the words `REpresentation State Transfer` in REST mean.

## State in REST ##

> "application state" refers to the state that determines "where" the user is in the process of completing a task. For example, when doing personal banking, is the user currently viewing account balances, filling in a bill payment form, or about to order new cheques? Those are each different application states. Some people mistakenly believe that "state" here refers to resource state, which would include, in this example, the balance of the accounts or the list of recent payments made. That isn't the case.
> Application state is also known by the name "session state", and is the kind of state referred to by REST's "stateless" constraint, which requires that the client maintain it exclusively. In contrast, if you were using a remote session technology like VNC or Windows Remote Desktop, then the application state is kept entirely on the server.

## State Transfer in REST ##

In Roy Fielding's REST dissertation, a REST client is defined as:

>an engine that moves from one state to the next by examining and choosing from among the alternative state transitions in the current set of representations.

For instance, consider a Flickr desktop client which can talk to Flickr's REST API. The client might fetch the user's contacts by making a REST API call. Now the client is in the state of displaying these contacts. The client will transfer to another application state when the client makes a second API call to fetch the recent photos of the first contact in the user's contacts list. This is the "state transfer" which REST refers to.

## Hypermedia as the engine of application state transfer ##

How does the application state transfer happen in a client? Well the client achieves this by picking an alternative from a bunch of possible state transitions described in the response of a previous REST API call. And the way these state transitions are described in the API response is via hypermedia (hyperlinks). The use of hypermedia is mentioned in Roy Fielding's dissertation.

<pre><code>
&lt;contacts page=&quot;1&quot; pages=&quot;1&quot; perpage=&quot;1000&quot; total=&quot;3&quot;&gt;
  &lt;contact nsid=&quot;http://api.flickr.com/services/rest/?method=flickr.people.getInfo?auth_key=xxxx&user_id=12037949629@N01&quot;
                 username=&quot;Eric&quot; iconserver=&quot;1&quot;
                 realname=&quot;Eric Costello&quot;
                 friend=&quot;1&quot; family=&quot;0&quot; ignored=&quot;1&quot; /&gt;
  &lt;contact nsid=&quot;http://api.flickr.com/services/rest/?method=flickr.people.getInfo?auth_key=xxxx&user_id=12037949631@N01&quot;
                 username=&quot;neb&quot; iconserver=&quot;1&quot;
                 realname=&quot;Ben Cerveny&quot;
                 friend=&quot;0&quot; family=&quot;0&quot; ignored=&quot;0&quot; /&gt;
  &lt;contact nsid=&quot;http://api.flickr.com/services/rest/?method=flickr.people.getInfo?auth_key=xxxx&user_id=41578656547@N01&quot;
                 username=&quot;cal_abc&quot; iconserver=&quot;1&quot;
                 realname=&quot;Cal Henderson&quot;
                 friend=&quot;1&quot; family=&quot;1&quot; ignored=&quot;0&quot; /&gt;
&lt;/contacts&gt;
</code></pre>

Lets assume the above is the response from a Flickr API call to fetch the contacts of a user. The response indicates potential state transitions possible from the current application state described by the `nsid` attributes of the `<contact>`s. The value of the `nsid` attribute is the hypermedia/hyperlink which when fetched will transfer the client's application state from the current state to a new one. Read the [original article](http://www.infoq.com/articles/mark-baker-hypermedia) to see why the author argues that Flickr's API violates this "hypermedia" constraint of REST.

## Machine-readable hypermedia? ##

In the above example, the only way a client will know that it can extract the `nsid` attributes of the `<contact>`s and use that hyperlink for a state transition is if the client was purpose-built for that API. In [Describing RESTful Applications](http://www.infoq.com/articles/subbu-allamaraju-rest), Subbu Allamaraju demonstrates a way to describe these hyperlinks generically so any client (given limited knowledge) can execute these state transitions via hyperlinks for any API. He achieve this by using custom domain-specific `Content-Type` headers in HTTP responses, and `<link>` tags (with `rel` and `type` attributes).
