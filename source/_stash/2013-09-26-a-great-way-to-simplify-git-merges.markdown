---
layout: post
status: publish
published: true
title: A Great Way to Simplify Git Merges
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4525
wordpress_url: http://www.edmondscommerce.co.uk/?p=4525
date: 2013-09-26 17:34:04.000000000 +01:00
categories:
- git
tags:
- checkout
- git
- merge
- meld
- mergetool
- branch
---
If you are struggling with a git merge with a long list of failed merge files then this little trick might be helpful.

The standard approach is to go file by file and use git mergetool to open the files in a tool like Meld and then manually manage the differences. In many cases though you know exactly which version you want and this is simply a laborious process that doesn't really require human input.

The solution to this is deceptively simple. All you need to do is to check out the file from the branch you want to keep the version of. If you have an entire directory where you know that the branch (for example master) has the correct version then you can check out that entire directory.

You might find that sensible use of this technique can save you lots of time and really make the mergetool the one you use for the files where you really do need to merge.

Thanks to <a href="http://stackoverflow.com/questions/914939/simple-tool-to-accept-theirs-or-accept-mine-on-a-whole-file-using-git?answertab=active#tab-top">this StackOverflow answer</a> for simplifying this for me.
