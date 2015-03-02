---
layout: post
title: "Getting rid of the chain of quoted replies in Gmail"
date: 2015-03-02 19:02:28 +0000
comments: true
author: kenneth
categories: 
 - gmail
tags: 
 - gmail
 - email
 - css
 - chrome
 - firefox
 - css
description: Setting up your browser to hide the quoted text that often gets injected into emails
---

##The problem with quoted replies

One of Gmail's stronger features is its threaded email conversations, allowing you to see emails as a chain of the back-and-forth, instead of the classic Inbox and Sent folder situation.

Mail clients often include the email chain as part of the email itself, and for the most part these are marked up in such a way that Gmail can hide them with the small ellipses button.

Sometimes though this doesn't work, and you end up having to scroll past page after page of quoted replies, which can be a right pain.

In probably 75% of the cases these have some HTML wrapped around them, which we can use to hide them when needed.

##Using Stylish to hide them in your browser

Because Gmail is a web-based client, you can use normal browser extensions to manipulate it. [Stylish](http://en.wikipedia.org/wiki/Stylish) is a browser extension that allows you to set up CSS rules that are applied on the pages you're using.

Here's a snippet of CSS that will hide the needless quoted replies, with the ability to hover over them if you really need to see them

```

// Make quoted replies a small block
.im, .gmail_extra {
  height:30px;
  width:100px;
  background:#EFEFEF;
  overflow:hidden;
  display:block;
}

// Allow these to be expanded when hovered
.im:hover,
.gmail_extra:hover
{
  height:auto;
  max-height:250px;
  width:auto;
  overflow:auto;
  background:#EFEFEF;
}

// Show a little notice that they can be expanded
.im:before, .gmail_extra:before {
  content:"Snipped Quote, hover to expand";
  color:#666666;
}

// Don't hide nested quote blocks
.im .im,
.gmail_extra .gmail_extra,
.im .gmail_extra,
.gmail_extra .im
      {
  height:auto;
  max-height:none;
  width:auto;
  overflow:auto;
  background:#EFEFEF;
}

.gmail_extra .im:before {
  content:"";
}

```

##The result

What was previously a big mess of nested quotes and signatures

{% img /assets/2015-03-02-GmailQuote1.png %}

Becomes a small "Hover to expand" box

{% img /assets/2015-03-02-GmailQuote2.png %}

Viewing it in the scrollable box

{% img /assets/2015-03-02-GmailQuote3.png %}

These styles work at the date of publication, but obviously Google might change the classes used for these.
