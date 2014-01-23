---
layout: post
status: publish
published: true
title: 'Installing Percona DB on a clean CentOS '
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3572
wordpress_url: http://www.edmondscommerce.co.uk/?p=3572
date: 2012-11-09 15:22:41.000000000 +00:00
categories:
- percona
tags:
- mysql
- magento
- error
- solution
- centos
- install
- remove
- rpm
- percona
- yum
---
Percona is a performance optimised fork of MySQL that has gained a lot of traction in the Magento-sphere as webmasters and sysadmins alike look to squeeze the most performance out of their hardware.

If you read the <a href="/platforms/magento">Magento</a> performance whitepaper then you will see they mention Percona DB there.

To install Percona on a standard CentOS release 6.2 (Final) server you would need to run the following commands:

First set up the repo:
```bash

rpm -Uhv http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm

```

This should give you output like this:
```

Retrieving http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm
Preparing...                ########################################### [100%]
   1:percona-release        ########################################### [100%]

```

Then installing should be a simple case of running:
```bash

yum install Percona-Server-client-55 Percona-Server-server-55

```

However I found that this generated the following error:
```

Error: Percona-XtraDB-Cluster-client conflicts with Percona-Server-client-55

```

The problem is because MySQL is already installed and needs to be removed. You can do this with this command:

```bash

yum remove mysql*

```

At which point running the install should work smoothly.
