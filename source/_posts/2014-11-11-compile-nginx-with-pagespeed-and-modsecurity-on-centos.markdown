---
layout: post
title: "Compile NGINX with PageSpeed and ModSecurity on CentOS"
date: 2014-11-11 14:06:37 +0000
comments: true
author: joseph
categories: 
 - linux
tags: 
 - nginx
 - pagespeed
 - modsecurity
 - linux
 - centos
description: "A script to compile and install NGINX with PageSpeed and ModSecurity on CentOS"
---

ModSecurity is a brilliant addition to web servers to block any nefarious requests before they hit your application. 
This improves security and reduces load if your server comes under attack as the requests are killed very quickly.

PageSpeed is a module provided by Google to automatically improve the performance of your web pages in the browser. In a stroke it can offer a much more responsive front end with just a few configuration options.

Nginx is a very fast and lightweight web server ideal for using with back end servers such as PHP-FPM.

Here is a script that will download and compile Nginx with the two modules and also apply the correct ModSecurity configuration.

``` bash

#!/bin/bash
echo "Please run as root"
yum install gcc-c++ pcre-dev pcre-devel zlib-devel make unzip

NPS_VERSION=1.9.32.2;

NGINX_VERSION=1.7.7;

MODSEC_VERSION=2.8.0

NGINX_EXTRA_MODULES=" --with-http_realip_module --with-http_ssl_module ";

NGINX_ADD_MODULES=''

WORKING_DIRECTORY=/opt/nginx_with_pagespeed_and_mod_security

mkdir -p $WORKING_DIRECTORY


echo "
===============================================================================

Mod Security

Installing dependencies, grabbing the repo, checking out the tag for our version and building it
------------"
cd $WORKING_DIRECTORY
yum install libtool httpd-devel libxml2 libxml2-devel
git clone https://github.com/SpiderLabs/ModSecurity.git
cd ModSecurity
git checkout tags/v${MODSEC_VERSION}
./autogen.sh
./configure --enable-standalone-module --disable-mlogc
make
make install
NGINX_ADD_MODULES="$NGINX_ADD_MODULES --add-module=$WORKING_DIRECTORY/ModSecurity/nginx/modsecurity "
echo "

Mod Security Config and Rules
-----------------------------

For nginx, we have to get all the config and cat it all into one single config file
"
wget https://raw.githubusercontent.com/SpiderLabs/ModSecurity/master/modsecurity.conf-recommended
cat modsecurity.conf-recommended  > /etc/nginx/modsecurity.conf
wget https://github.com/SpiderLabs/owasp-modsecurity-crs/tarball/master -O owasp-modsecurity-crs.tar.gz
tar -xvzf owasp-modsecurity-crs.tar.gz
CRS_DIR=$(find . -type d -name SpiderLabs-owasp-modsecurity-crs*)
cat ${CRS_DIR}/modsecurity_crs_10_setup.conf.example >> /etc/nginx/modsecurity.conf
cat ${CRS_DIR}/base_rules/modsecurity_*.conf >> /etc/nginx/modsecurity.conf
for f in $(find $CRS_DIR -type f -name *.data)
do
    FILE=$(basename $f)
    CMD="cp $f /etc/nginx/$FILE"
    echo ${CMD}
    ${CMD}
done
cp ModSecurity/unicode.mapping /etc/nginx/unicode.mapping

echo "
===============================================================================

Page Speed
----------

Downlading the pagespeed version and building this
"
cd $WORKING_DIRECTORY
wget https://github.com/pagespeed/ngx_pagespeed/archive/release-${NPS_VERSION}-beta.zip
unzip release-${NPS_VERSION}-beta.zip
cd ngx_pagespeed-release-${NPS_VERSION}-beta/
wget https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}.tar.gz
tar -xzvf ${NPS_VERSION}.tar.gz  # extracts to psol/
NGINX_ADD_MODULES="$NGINX_ADD_MODULES --add-module=$WORKING_DIRECTORY/ngx_pagespeed-release-${NPS_VERSION}-beta "

echo "
===============================================================================

Nginx
-----
Finally, compiling Nginx with our extra modules and the added modules and installing it
"
cd $WORKING_DIRECTORY
wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
tar -xvzf nginx-${NGINX_VERSION}.tar.gz
cd nginx-${NGINX_VERSION}/
./configure $NGINX_ADD_MODULES $NGINX_EXTRA_MODULES
make
sudo make install

echo "
===============================================================================

COMPLETED INSTALL - CHECKING

checking the nginx version now, should be $NGINX_VERSION and you should see our modules
"
nginx -V

echo "
And now doing a config test"
/etc/init.d/nginx configtest


echo "
===============================================================================

SCRIPT COMPLETED

However, you are not there yet

You need to go and look at the /etc/nginx/modsecurity.conf file and change settings there as appropriate

Also you need to modify your nginx vhost config - see:
https://github.com/SpiderLabs/ModSecurity/wiki/Reference-Manual#Configuration_Steps
"
```

