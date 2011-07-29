--- 
layout: default
title: http://blogs.digitar.com/jjww/2009/01/rabbits-and-warrens/
tags: []

type: link

---
<a href="http://blogs.digitar.com/jjww/2009/01/rabbits-and-warrens/">http://blogs.digitar.com/jjww/2009/01/rabbits-and-warrens/</a>

Nice article providing a quick intro to RabbitMQ/AMQP terminology.

Summary:

 * Virtual hosts - one RabbitMQ server can host multiple virtual hosts (each virtual host maps to one user process). One virtual host can contain multiple exchanges.
 * Queues - queues hold messages which consumers can consume.
 * Routing keys - each message has a routing key.
 * Exchanges - producers drop off messages at exchanges. Queues are registered with the exchanges.
 * Bindings - bindings are routes configured on the exchange to let the exchange know how to route messages with routing keys to queues (a message can be routed to multiple queues aka one routing key can match multiple bindings/routes).
