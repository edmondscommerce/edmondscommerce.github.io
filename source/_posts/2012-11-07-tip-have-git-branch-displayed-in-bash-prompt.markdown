---
layout: post
status: publish
published: true
title: 'Tip: Have Git Branch Displayed in Bash Prompt'
author: martyn
author_login: martyn
author_email: info+martyn@edmondscommerce.co.uk
wordpress_id: 3551
wordpress_url: http://www.edmondscommerce.co.uk/?p=3551
date: 2012-11-07 16:53:02.000000000 +00:00
categories:
- linux
tags:
- ubuntu
- linux
- developer
- git
- bash
- tip
---
This is a very small tip, but one that can really save accidents in the long term.

To display the current branch in git simply add the following to your .bashrc in your home directory :
```bash

__git_ps1 () 
{ 
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf " (%s)" "${b##refs/heads/}";
    fi
}

PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\$( __git_ps1 ) \$\[\033[00m\] "

```

This is based on the Linux Mint prompt so is nicely coloured as well.
