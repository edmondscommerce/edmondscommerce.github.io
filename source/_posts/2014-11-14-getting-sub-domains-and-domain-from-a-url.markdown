---
layout: post
title: "Getting sub domains and domain from a url"
date: 2014-11-14 13:34:08 +0000
comments: true
author: joseph
categories: 
- php
tags:
- url
- domain
- subdomain
- php
description: "How to get the sub domain and domain from a URL in PHP"
---

At first it seems like a simple one - just use the `parse_url` function already built into PHP.

Unfortunately though, this just gives you the host - which is usually a combination of a subdomain - such as www - and the domain itself.

To resolve this I ended up writing the following code. It will gradually snip bits off the start of a host and then make a HTTP request until that request fails. 

Once it fails, we know that we have snipped off all of the sub domains we can and we have our final domain.

Here is the code:

``` php
    public function getDomain($url)
    {
        if (!$this->_domain) {
            $host = parse_url($url, PHP_URL_HOST);
            $sanity = $this->getHeadersForUrl($host);
            if (!$sanity) {
                throw new ErrorException("No headers when sanity checking full host: $host in " . __METHOD__);
            }
            $elems = explode('.', $host);
            $subdomains = array();
            $domain = false;
            while (!$domain) {
                $check = implode('.', $elems);
                $headers = $this->getHeadersForUrl($check);
                if ($headers) {
                    $subdomains[] = array_shift($elems);
                } else {
                    array_unshift($elems, array_pop($subdomains));
                    $domain = implode('.', $elems);
                }
            }
            $this->_domain = $domain;
        }
        return $this->_domain;
    }

    public function getHeadersForUrl($url, $followOnLocation = true)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, true);
        curl_setopt($ch, CURLOPT_NOBODY, true);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, $followOnLocation);
        curl_setopt($ch, CURLOPT_MAXREDIRS, 10);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

        $data = curl_exec($ch);

        return $data;
    }

```
