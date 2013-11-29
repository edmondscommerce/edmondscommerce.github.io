---
layout: post
title: "Ruby Syntax Highlighting with PHPStorm"
date: 2013-11-28 10:30:12 +0000
comments: true
categories: 
- phpstorm
- ruby
---

PHPStorm is my IDE of choice for PHP development of course and also as many other languages as I can get it to support. One of my favourite plugins for PHPStorm is BASH Support which makes it into a fully featured BASH IDE with function support and syntax highlighting and some code inspections.

As we are now moving to Octopress for blogging functionality I wanted a way to get Ruby syntax highlighting. There is a full blown IntelliJ based Ruby IDE but that is overkill for my needs. I had a look at Netbeans however it has now stopped supporting Ruby though there is a community supported plugin apparently.

My best IDE solution so far is simply Vim, perhaps the [spf13 flavour](http://vim.spf13.com/).

After a bit of Googling good old Stack Overflow came through for me with [this post](http://stackoverflow.com/questions/16451359/is-it-possible-to-get-ruby-syntax-highlighting-in-phpstorm) that explains how to leverage PHPStorm's TextMate bundle support to get Ruby syntax highlighting. This works a treat though on my colour scheme (a slightly modified Darcula) it was unreadable. The final thing to do is to change the settings under Settings > TextMate Bundles and in the grid at the bottom next to my theme I switched the TextMate colour scheme from Mac Classic to RailsCasts and now it looks good.
