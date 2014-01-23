---
layout: post
status: publish
published: true
title: Install Git on Centos 5 - Install EPEL on Centos
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1791
wordpress_url: http://www.edmondscommerce.co.uk/?p=1791
date: 2010-08-25 16:35:23.000000000 +01:00
categories:
- git
tags:
- git
- centos
- install
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
To install Git on a Centos server you need to install something called EPEL first. 

This is an extra repository of apps which you need to have accessible in order to install Git.

I tried other tutorials on the net that were quite extensive but didn't work. In the end its just two commands:

1. Install EPEL:
```

rpm -Uvh http://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-3.noarch.rpm

```
<a href="http://fedoraproject.org/wiki/EPEL/FAQ#How_can_I_install_the_packages_from_the_EPEL_software_repository.3F">http://fedoraproject.org/wiki/EPEL/FAQ#How_can_I_install_the_packages_from_the_EPEL_software_repository.3F</a>

2. Install Git + Git Daemon
```

yum install git git-daemon

```

For me to get it to work, I had to manually change the epel.repo file because I had created a non functional one previously. I got the warning:

warning: /etc/yum.repos.d/epel.repo created as /etc/yum.repos.d/epel.repo.rpmnew

So I just did the following:

```

cd /etc/yum.repos.d/
mv epel.repo epel.repo.old
mv epel.repo.rpmnew epel.repo

```
