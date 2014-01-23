---
layout: post
status: publish
published: true
title: Correct recursive backups in bash
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 3979
wordpress_url: http://www.edmondscommerce.co.uk/?p=3979
date: 2013-02-20 20:54:57.000000000 +00:00
categories:
- bash
tags:
- linux
- problem
- wordpress
- solution
- bash
- helpful tips
---
Sometime a backup script can go wrong, and rather the overwrite the old files you place a copy of the new ones into the same folder.

This can then escalate and before you know it you have multiple levels of the same files.

If you just want to flatten these files then this script can do that you

```bash

// The duplicated directory
DUPLICATED_DIR_NAME='uploads'
// A new directory for the files to go into
NEW_DIR_NAME='realuploads'
for f in `find ./ | grep $DUPLICATED_DIR_NAME/$DUPLICATED_DIR_NAME `; 
do 
NEWFILE=`echo $f | sed 's/$DUPLICATED_DIR_NAME\//\//g'`; 
NEWDIR=../$NEW_DIR_NAME/`dirname $NEWFILE`; 
if [[ ! -d $NEWDIR ]]
then
mkdir $NEWDIR; 
fi
cp -f &quot;$f&quot; ../$NEW_DIR_NAME/$NEWFILE; 
done

```
