---
layout: post
title: "Code Blocks with Liquid or Twig Tags using Octopress"
date: 2013-12-09 18:57:42 +0000
comments: true
author: joseph
categories: 
 - octopress
tags: 
 - codeblock
 - twig
 - liquid
 - escape
description: "How to use code blocks containing tags that are being incorrectly parsed by Octopress"
---

Here is a quicky I figured out when posting my previous story that included a snippet of Twig code. 

If you put Twig code into codeblocks, it doesn't work, instead of regarding anything inside the code block as escaped code, it tries to parse it.

The solution is simply to wrap your code in a raw tag like this: 

{% codeblock %}
{% raw %}
{% codeblock %}
{% raw %}
   // your code here
{% end[REMOVE_THIS_BIT]raw %}
{% endcodeblock %}
{% endraw %}
{% endcodeblock %}

In fact I had to do that to get this post to work as well
