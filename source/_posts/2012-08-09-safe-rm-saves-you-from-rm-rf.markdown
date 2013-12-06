---
layout: post
status: publish
published: true
title: safe-rm - saves you from rm -rf /*
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3234
wordpress_url: http://www.edmondscommerce.co.uk/?p=3234
date: 2012-08-09 15:59:14.000000000 +01:00
categories:
- linux
tags:
- ubuntu
- linux
- root
- backup
- centos
- rpm
- debian
---
Okay, so it's a sysadmin's nightmare that you might when tired miss out a dot from an rm -rf ./* and whilst you shouldn't run as root, there are times when permissions problems push you into it.

This little gem allows you to blacklist folders from rm (such as /etc /bin and other system directories, along with any custom ones you might want to protect).

It's in debian/ubuntu repositories so apt-get install safe-rm is quite useful, but it seems to be nowhere to be found for CentOS/RHEL, so we packaged it up (one of our employees used to be a package maintainer for a linux distro) for CentOS servers.

The original url for safe-rm is <a href="http://www.safe-rm.org.nz/" title="http://www.safe-rm.org.nz/">http://www.safe-rm.org.nz/</a> and our rpm is available <a href="http://www.edmondscommerce.co.uk/stuff/safe-rm-0.8-1.x86_64.rpm" title="here">here</a> - Feel free to mirror this elsewhere.

Next up: <a href="http://www.edmondscommerce.co.uk/linux/creating-rpms/" title="how we created the rpm">how we created the rpm</a>
