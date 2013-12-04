---
layout: post
status: publish
published: true
title: Wordpress Upgrade Bash Script
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3081
wordpress_url: http://www.edmondscommerce.co.uk/?p=3081
date: 2012-04-11 11:28:46.000000000 +01:00
categories:
- wordpress
tags:
- linux
- upgrade
- wordpress
- bash
- script
---
If you would like to upgrade wordpress directly on the command line using bash then you might like this little script:

```bash

#!/bin/bash
# This is a script to upgrade wordpress.
# Put it in your wordpress document root (the folder that contains wp-config.php)
# chmod +x to make executable
# ./wp-upgrade.bash to run
# Originally here: http://yabfog.com/blog/2011/12/12/wordpress-update-bash-script
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TMPDIR=/tmp/wp-upgrader
mkdir -p $TMPDIR
WPDIR=$TMPDIR/wordpress
mkdir -p $WPDIR
cd $TMPDIR
rm -rf latest.zip ./wordpress # Clean up from the last run
wget -nd http://wordpress.org/latest.zip
unzip latest.zip
mv $DIR/wp-config.php $DIR/.wp-config.php.backup # Stash your configuration someplace safe
rm $DIR/*.{txt,html,php} # Delete the old install
rm -rf $DIR/{wp-admin,wp-includes} # Delete more. Don't delete plugins or themes.
cp -aR $WPDIR/* $DIR/
mv $DIR/.wp-config.php.backup  $DIR/wp-config.php # Restore the configuration
# You may not need the last two lines. I like to give my web server the ability to write files.
#chown -R .www-data $DIR/*.php $DIR/wp-admin $DIR/wp-includes
#chmod -R g+w $DIR/*.php $DIR/wp-includes

```

Please don't use on a live site or anything like that, but for local development its a quick way to upgrade the site.

The script was originally <a href="http://yabfog.com/blog/2011/12/12/wordpress-update-bash-script">here</a> I simply edited it a little
