---
layout: post
status: publish
published: true
title: Magento Security Patch Script
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3171
wordpress_url: http://www.edmondscommerce.co.uk/?p=3171
date: 2012-07-10 16:29:28.000000000 +01:00
categories:
- magento
tags:
- security
- bug
- magento
- tool
- zend
- framework
- script
- fix
- free
- patch
- offer
---
We are currently offering a free service to apply the security patches for any Magento store. <a href="http://www.edmondscommerce.co.uk/magento/magento-security-vulnerability-free-assistance/">You can read all about that here</a>.

For those of you who are comfortable SSHing into your server and running things manually but would like this to be as easy as possible, you can use our bash script to automatically determine which Magento security patch you require and then apply it.

Simply run the following command:

```bash

wget -qO- http://www.edmondscommerce.co.uk/stuff/applysecuritypatch.sh | /bin/sh

```

For information, this is the source of the above file.

```bash

#!/bin/bash

if [ ! -f app/Mage.php ]; then
  echo "Not in the magento basedir. please run from public_html, httpdocs, www or wherever index.php is."
  exit 99
fi

WGET_BINARY=$(which wget)

if [ "" = "$WGET_BINARY" ]; then
  echo "Can't find wget in path... can't continue"
  exit 98
fi

MAGENTO_VERSION=$(grep 'function getVersionInfo\(\)' -A6 app/Mage.php | sed s/[^0-9]//g | tr '\n' '.' | sed s/'\.\.*'// | sed s/'\.$'//)
echo "Your Magento version is $MAGENTO_VERSION"

export $(grep 'function getVersionInfo()' -A6 app/Mage.php | grep = | sed s/,// | sed s/\>// | sed s/'[\t ]'//g | tr "a-z" "A-Z" | sed s/^/MAGENTO_/ | sed s/"'"//g)

set | grep MAGENTO

#
#Community Edition 1.4.0.0 through 1.4.1.1 http://www.magentocommerce.com/downloads/assets/1.7.0.2/CE_1.4.0.0-1.4.1.1.patch
#Community Edition 1.4.2.0 http://www.magentocommerce.com/downloads/assets/1.7.0.2/CE_1.4.2.0.patch
#Community Edition 1.5.0.0 through 1.7.0.1 http://www.magentocommerce.com/downloads/assets/1.7.0.2/CE_1.5.0.0-1.7.0.1.patch
#

if [ "$MAGENTO_MAJOR" -eq "1" ]; then
  if [ "$MAGENTO_MINOR" -eq "4" ]; then
    if [ $MAGENTO_PATCH -lt "2" ]; then
    	CORRECT_PATCH='http://www.magentocommerce.com/downloads/assets/1.7.0.2/CE_1.4.0.0-1.4.1.1.patch'
      echo "Running Magento < 1.4.2.0 - patch is $CORRECT_PATCH";
    else
      CORRECT_PATCH='http://www.magentocommerce.com/downloads/assets/1.7.0.2/CE_1.4.2.0.patch'
      echo "Running Magento 1.4.2.0 - patch is $CORRECT_PATCH";
    fi
  elif [ $MAGENTO_MINOR -gt "4" ]; then
    if [ $MAGENTO_MINOR -lt "7" ]; then
      CORRECT_PATCH='http://www.magentocommerce.com/downloads/assets/1.7.0.2/CE_1.5.0.0-1.7.0.1.patch'
      echo "Running Magento 1.5.0.0 or above - patch is $CORRECT_PATCH";
    elif [ $MAGENTO_MINOR -eq "7" -a $MAGENTO_PATCH -eq "0" -a $MAGENTO_REVISION -lt "2" ]; then
      CORRECT_PATCH='http://www.magentocommerce.com/downloads/assets/1.7.0.2/CE_1.5.0.0-1.7.0.1.patch'
      echo "Running Magento 1.5.0.0 or above - patch is $CORRECT_PATCH";
    else
      echo "Running Magento 1.7.0.2 - already patched."
      exit 1
    fi
  fi
else 
  echo "You're not running version 1.x.x.x of Magento, I have no idea what to do!"
  exit 97
fi 

wget -O - $CORRECT_PATCH 2> /dev/null | patch -p0
if [ $? -eq 0 ]; then
  echo "Patch succeeded."
else
  echo "For some reason the patch failed.  See the output above."
  echo "You could attempt to download the patch manually and apply it - the url is :- "
  echo $CORRECT_PATCH
fi

```

Please note this script is supplied without any warranty, use at your own risk. We are not supplying the patch files simply making it easy to download and apply the correct one.

We strongly recommend you patch your store as soon as possible.

<b><a href="http://www.edmondscommerce.co.uk/contact-us/?about=Free+Magento+Security+Fix"> If you need help, just ask!</a></b>

