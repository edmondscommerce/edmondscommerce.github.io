---
layout: post
status: publish
published: true
title: Magento Not Working, Not Creating Report Files Either + Solution
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3816
wordpress_url: http://www.edmondscommerce.co.uk/?p=3816
date: 2013-01-02 14:49:35.000000000 +00:00
categories:
- magento
tags:
- magento
- file
- solution
- sessions
- report
- space
- drive
- not
- filesystem
- limit
- working
- inode
- var
---
If you have a Magento site that is consistently erroring out and giving you the report screen with the file name, but the file does not exist in the reports folder then this could be your solution.

The most likely culprit in this scenario is that the filesystem has run out of space. If this happens, Magento will die because it literally can't create any files and it needs to do this for caching, session etc.

You can easily check this by running this command:

```bash

df -h

```

If you see any filesystems with 100% usage then you have your answer, you have run out of hard drive space and need to free some space up by deleting files.

On occasion though you might run this and see that you still have plenty of space. This can be puzzling at first though you need to bear in mind that Linux filesystems don't purely use space but also something called <a href="http://en.wikipedia.org/wiki/Inode" title="wikipedia explanation of inodes" target="_blank">inodes</a>.

An inode is like a file pointer, you need one for every file that is in the filesystem. Also there is a limit to the number of inodes in any file system. If something goes crazy and your system creates lots of small files then you might find that you run out of inodes before you run out of hard drive space.

To check if this is your issue run this command:

```bash

df -i

```

If you see any lines with 100% then you have run out of inodes and you need to delete some files. There are numerous possible causes of this and tactics that can be used to clear them out. When dealing with Magento though there are a few usual suspects.

Magento is a real culprit for this behaviour as it uses file system based sessions by default. Session files are very small and can be very numerous.

The quick fix is just to completely remove the sessions directory:

```bash

rm -rf /path/to/magento/var/session

```

Magento will recreate it on the next request.

If you would like to try to clear out just older sessions then you can do something like this:

```bash

find /path/to/magento/var/session -name 'sess_*' -type f -mtime +7 -exec rm {} \;

```
