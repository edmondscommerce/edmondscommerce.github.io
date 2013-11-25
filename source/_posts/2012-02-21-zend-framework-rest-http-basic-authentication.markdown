---
layout: post
status: publish
published: true
title: Zend Framework Rest HTTP Basic Authentication
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2944
wordpress_url: http://www.edmondscommerce.co.uk/?p=2944
date: 2012-02-21 12:43:44.000000000 +00:00
categories:
- zend framework
tags:
- http
- problem
- magento
- zend
- solution
- framework
- api
- auth
- rest
- basic
- authentication
- setauth
- encoding
---
I have recently been working on a Magento project that required a custom API integration with Zen Desk.

Magento is based on Zend Framework which is nice because it means we can use the Zend_Rest_Client object to handle the API integration which provides a nice layer of abstraction and sorts out a lot of the heavy lifting required.

However I came across a terminal issue trying to get it working properly with HTTP Basic Authentication which the Zen Desk API uses.

I found some instructions which recommended creating a Zend_Uri_Http object and then setting the username and password against this. However as Zen Desk uses the email address as the username component, this failed completely.

In the end the solution I found was to grab the static HTTP client object that the REST client is built upon and call the public setAuth method on this. This way the Authorisation header is correctly created, encoded and appended to the headers.

Logically it feels like a dirty way to do things, grabbing the HTTP client statically to do this, but it works and I can't see how else you would do it.

For info here is the code:

```php

/**
     * @return Zend_Rest_Client 
     */
    protected function getClient() {
        if (null === $this->_client) {
            $url = $this->getApiUrl();
            $uri = Zend_Uri_Http::fromString($url);
            $this->_client = new Zend_Rest_Client($uri);
            Zend_Service_Abstract::getHttpClient()->setAuth($this->getUsername(),$this->getPassword());
        }
        return $this->_client;
    }

```
