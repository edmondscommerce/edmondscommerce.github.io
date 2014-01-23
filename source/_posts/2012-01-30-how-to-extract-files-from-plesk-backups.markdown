---
layout: post
status: publish
published: true
title: How To Extract Files from Plesk Backups
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2907
wordpress_url: http://www.edmondscommerce.co.uk/?p=2907
date: 2012-01-30 17:25:16.000000000 +00:00
categories:
- plesk
tags:
- development
- linux
- server
- plesk
- developer
- files
- hosting
- backup
- solution
- tip
- extract
---
So you have a plesk backup file and you want to extract and open the files from it? No problem. This blog will show you how.

The file is a mime file. The "mpack" package will let you unpack it.

First we install the "mpack" package
```
sudo apt-get install mpack
```

Let's imagine your file is called "pleskDump.gz". If it doesn't have a ".gz" at the end it might not be bad to add it as some environments will complain if it's absent.

Next we unzip the file
```
gunzip pleskDump.gz
```

Now let's un-mime the file
```
mkdir pleskDumpOutput
cd pleskDumpOutput
cat ../pleskDump | munpack
```

Now we have a bunch of regular tar files, but be careful, if we just extract them, the root folders will not be recreated. In order to keep things together, it's best now to look at the output you have. Let's take a made up example:
```
example-domain.com.httpdocs
```

Note that the format is essentially domain.rootfolder or in another way, the tar files have your domain name they are archiving, then a dot, then the name of the root folder they made up. We take that root folder and create it like this:
```
mkdir rootfolder
```

Now let's apply that idea to our previoud example; "example-domain.com"
```
mkdir httpdocs
```

It's time to untar into the folder you just created, let's assume you just created "httpdocs"
```
tar -xvf example-domain.com.httpdocs -C httpdocs
```

There you go! You can now output any of the folders you wanted.
