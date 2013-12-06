---
layout: post
status: publish
published: true
title: Git Diff Colours By Default
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3221
wordpress_url: http://www.edmondscommerce.co.uk/?p=3221
date: 2012-08-07 14:48:08.000000000 +01:00
categories:
- git
tags:
- git
- color
- colour
- shell
- bash
- tip
- diff
- config
---
If you want to make git-diff use colours by default, try running this little command:

```bash

echo '[color]
 branch = auto
 diff = auto
 status = auto
[color "branch"]
 current = yellow reverse
 local = yellow
 remote = green
[color "diff"]
 meta = yellow bold
 frag = magenta bold
 old = red
 new = cyan
[color "status"]
 added = yellow
 changed = green
 untracked = cyan' >> ~/.gitconfig

```

Simply copy and paste the above to your command line and hit return.

Then if you run:

```bash
git diff master..BRANCH
```

You will get a nice coloured display
