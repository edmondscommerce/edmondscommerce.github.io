---
layout: post
status: publish
published: true
title: SSH Access, what is it all about in Simple Words?
author: nolwenn
author_login: nolwenn
author_email: info+nolwenn@edmondscommerce.co.uk
wordpress_id: 3525
wordpress_url: http://www.edmondscommerce.co.uk/?p=3525
date: 2012-11-05 16:29:37.000000000 +00:00
categories:
- server
tags:
- security
- server
- ssh
- hosting
- access
- internet
- simple
- explanation
---
<h3>What is an SSH access?</h3>
SSH stands for Secure Socket Shell. SSH is a protocol, like HTTP, it gives us a way to gain a secure access to remote computers.

The principle is to connect two networked computers via a secure encrypted channel within an insecure network environment such as the Internet.

With SSH access we can easily move files around and run programs on your server. We can also transmit files to and from our own network onto your server, for example to take a copy of your site for local development or to push updated files onto your server.

SSH needs a server application installing on your server (most web servers will have this by default) and an SSH client on your local machine to allow you to connect to your server.

<h3>Where do you get your SSH access from?</h3>
If you need SSH access details you should ask your hosting company, they should be able to install it for you if it is not already in place. If you are on shared hosting then the chances are that you will not be able to get SSH access details, if you need SSH access then you should consider upgrading your hosting to something that will support it.

SSH access details will consist of at least:

domain or IP address:
```

domain.com

```
```

123.123.123.123

```

username:
```

mywebserverlogin

```

password:
```

ihy324579ySDWf

```

it may also include a port if SSH is not running on the standard port. 
```

2020

```
<h3>Why do we need the SSH access details?</h3>
We will always ask our customers to provide us with SSH access details. This is for two main reasons:

<h4>1. Power and Speed</h4>
SSH access allows us to run commands directly on the server, compress files, run scripts etc. For example we will generally run some static analysis scripts for our <a href="/platforms/magento">Magento</a> customers using a bash script that we can run with SSH access. This gives us some instant feedback on the state of your Magento installation and allows us to spot any potential problems.

If we need to get a copy of your site files, using SSH we can prepare a compressed archive of your site files allowing us to download them much faster. Likewise we can easily get a reliable database dump, especially if you have a large database that might cause problems for browser based tools such as phpMyAdmin.

<h4>2. Security</h4>
SSH is a much more secure protocol than something like FTP. In SSH everything is encrypted. It has been built from the ground up to be a very secure way of networking and inter communicating between servers on an insecure network such as the web.
