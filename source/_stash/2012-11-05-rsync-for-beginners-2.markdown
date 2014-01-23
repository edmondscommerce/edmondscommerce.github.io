---
layout: post
status: publish
published: true
title: Rsync For Beginners
author: daya
author_login: daya
author_email: info+daya@edmondscommerce.co.uk
wordpress_id: 3499
wordpress_url: http://www.edmondscommerce.co.uk/?p=3499
date: 2012-11-05 16:42:47.000000000 +00:00
categories:
- linux
tags:
- linux
- server
- scp
- ssh
- bash
- unix
- sh
- remote
- internet
- rsync
- rsh
- rcp
- filesystem
- localhost
---
<h3>What is Rsync in general ?</h3>

Rsync works like the <a href="http://linux.about.com/od/commands/l/blcmdl1_rcp.htm" rel="nofollow">rcp</a> command in linux. It is used to copy files across machines. It uses efficient checksum algorithm that looks for modified files by time and size. It is used for two purposes:

<h2>Backup</h2>
 
Rsync is used to transfer file from the local to a remote machine. By default Rsync will use rsh, however you can instead use <a href="http://linux.about.com/od/commands/l/blcmdl1_ssh.htm" rel="nofollow">ssh</a> for high security. Compressed files are transferred to save file transfer time and reduce the load on the network. It helps to transfer bulk files in minutes.

<h2>Mirroring</h2>

Rsync can synchronize file between two servers location(i.e) local and remote. By using the checksum algorithm it updates local files only if it is updated in remote server.

<h3>How to use Rsync</h3> 
```php


rsync -avze ssh -p2020 root@server.com:/sitepath/files   /localdata


```
This command transfer files from remote server to local machine.

a  Archive. It is denotes all related files and documents.
v  Verbose.It will display status message as it is processing.
z  Compression.It achives better compression ratio.
e  It allows to chose alternative remote shell program for communication. 

```php


rsync -avze ssh -p2020 --exclude home/var/cache root@server.com:/sitepath/files /localdata


```

This command will transfer files from remote server to local machine by excluding cache folder.

```php


rsync -avz /sitepath/files root@server.com:/localdata 


```
This command will  transfer all file from local to remote server. It is uses default remote shell protocol.
