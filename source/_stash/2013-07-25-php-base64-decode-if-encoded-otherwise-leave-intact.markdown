---
layout: post
status: publish
published: true
title: PHP Base64 Decode if Encoded Otherwise Leave Intact
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4421
wordpress_url: http://www.edmondscommerce.co.uk/?p=4421
date: 2013-07-25 15:05:08.000000000 +01:00
categories:
- php
tags:
- php
- xml
- string
- api
- simplexml
- base64
- encode
- decode
---
I had a scenario where an API I was working with would sometimes base64 encode data (instead of using CDATA which is the more usual approach).

However to really make things interesting, they didn't always do this so you couldn't just go and decode everything.

Here is the solution I came up with:

First of all, take the raw response and run preg_replace_callback on it to grab all of the XML contents:

```php

preg_replace_callback('%>([^<]+?)<%', array($this, '_decode'), $response)

```

Then the callback function is a method on the same object hence the use of array($this, '_decode')

```php

    /**
     * Decode from bas64 if it actually is base64 encoded in the first place
     *
     * If not return the raw string
     *
     * @param $matches
     * @return string
     */
    protected function _decode($matches)
    {
        $raw=$matches[1];
        $decoded = base64_decode($raw, true);
        $return=$decoded;
        if(false === $decoded){
            $return=$raw;
        }elseif(base64_encode($decoded) != $raw){
            $return=$raw;
        }
        return '><![CDATA[' . $return . ']]><';
    }

```

What this method does is first of all try calling decode with the optional strict flag. This makes the function return false if it thinks it isn't base64 encoded. It would be great if this was enough but unfortunately you need to do more.

If it doesn't return false at that stage, we do the real test which is to try encoding it back to base64 and make sure that the rencoded string matches the raw (before original decoding) string. If it was base64 encoded in the first place then this should match.

By doing this we can handle any kind of mixture of base64 encoded and plain text xml string and get it ready for simpleXMl.

Notice I am also wrapping the data in CDATA tags to help avoid XML issues when creating the simpleXml object.

However - one last trick. The reason they were using base64 encoding is because there was some dodgy non XML friendly characters in there. The solution here (if you don't mind compromising the data a little which I didn't for my purposes) then you can do the following:

```php

//have to utf8 encode it to fix the fact its not properly encoded at their end
$xml = simplexml_load_string(utf8_encode($response));

```

And that's it, another crazy API defeated and bent to my will!
