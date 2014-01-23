---
layout: post
status: publish
published: true
title: Linux LS command for Directories only
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2817
wordpress_url: http://www.edmondscommerce.co.uk/?p=2817
date: 2012-01-10 12:58:31.000000000 +00:00
categories:
- linux
tags:
- directories
- linux
- list
- tip
- ls
- folders
- alias
- bashrc
---
If you have a large folder that contains a lot of files but you only want to see what directories are in there, then this little snippet is for you:

```

ls -d -- */

```

You may decide to make an alias for it

```

echo "alias lld='ls -alFhd -- */'" >> ~/.bashrc

```
