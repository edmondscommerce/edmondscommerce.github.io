---
layout: post
status: publish
published: true
title: Vim Locking Up, Always When you are Ready to Save? Solution
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4534
wordpress_url: http://www.edmondscommerce.co.uk/?p=4534
date: 2013-10-04 10:33:41.000000000 +01:00
categories:
- linux
tags:
- ssh
- solution
- save
- vim
- freeze
- locked
---
If you are constantly frustated by Vim freezing up on you are editing a file on a server then this is quite possibly your problem, and your solution.

The issue is that most text editors and IDEs have [ctrl]+[s] mapped to save. If you do a lot of file editing then you probably bash the [ctrl]+[s] combo all the time, without even thinking about it...

Now back to Vim. As it is running in the terminal then it can be frozen by using the [ctrl]+[s] combination. You probably weren't aware of that feature.

To bring things back to life, just hit the [ctrl]+[q] combo. There are ways to permanently disable this which you can try.

For full information on this, check out this great <a href="http://unix.stackexchange.com/questions/12107/how-to-unfreeze-after-accidentally-pressing-ctrl-s-in-a-terminal" target="_blank">stack exchange page</a>.
