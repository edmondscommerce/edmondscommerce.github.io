---
layout: post
status: publish
published: true
title: CentOS + Sun Java + Amazon AMTU 2
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3254
wordpress_url: http://www.edmondscommerce.co.uk/?p=3254
date: 2012-08-14 17:33:31.000000000 +01:00
categories:
- amazon
tags:
- web
- linux
- amtu
- xml
- product
- data
- shell
- integration
- line
- feed
- services
- transport
- amazon
- document
- automation
- mws
- command
- daemon
---
In a follow up to our popular blog post describing the process of getting AMTU 1 set up on a Centos server, this post describes how to get the latest version 2 of AMTU running.

Things have moved on and thankfully it is a lot easier than it was.

Firstly get Sun Java installed. You will need to get the URL for downloading the RPM from here:
http://www.oracle.com/technetwork/java/javase/downloads/jre7-downloads-1637588.html

Accept the agreement, download the correct RPM version and then pause it. Copy the download URL and paste it into this command:
```bash

cd /tmp
wget [paste-url]-here]
rpm - jre [hit tab to complete]

```

Now check the correct java version is being used:

```bash

java -version

```

You should get something looking like:

```

[root@94 tmp]# java -version
java version &quot;1.7.0_05&quot;
Java(TM) SE Runtime Environment (build 1.7.0_05-b06)
Java HotSpot(TM) 64-Bit Server VM (build 23.1-b03, mixed mode)

```

Now you can install AMTU

```bash

wget https://d28hcfptedr5ia.cloudfront.net/install/AMTU_unix.sh
chmod +x AMTU_unix.sh
./AMTU_unix.sh

```

Keep hitting enter to get to the bottom of the terms and then agree, agree to all the other options. That is AMTU installed.

The final step is to configure this using the CLI configure utitlity.

You need to create an xml file for the AMTU configuration. You can see a sample file in /opt/amtu/xml/sample.xml.

Lets copy that file and then edit it accordingly.

```bash

cd /opt/amtu/xml
cp sample.xml configuration.xml
vim configuration.xml

```

You do need to be signed up for MWS to get some of the keys etc that are required. If not already, go to this page and hit the sign up button. 
https://developer.amazonservices.co.uk/index.html

Once you have updated the XML configuration you run this command to apply it:
```bash

/opt/amtu/Utilities/configure SETUP /opt/amtu/xml/configuration.xml

```

If you get some error messages at this point, edit the configuration and try again. Once you have the configuration set you can start the daemon.

```bash

/opt/AMTU/Utilities/amtu_daemon start

```

