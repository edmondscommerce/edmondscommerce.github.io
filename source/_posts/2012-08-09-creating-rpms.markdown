---
layout: post
status: publish
published: true
title: Creating RPMs
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3237
wordpress_url: http://www.edmondscommerce.co.uk/?p=3237
date: 2012-08-09 16:24:34.000000000 +01:00
categories:
- linux
tags:
- linux
- developer
- centos
- tip
- rpm
---
One thing that I often get asked as a package maintainer is how hard is it to make rpms?

Well, here's a little secret, if you have the right tools, it's actually quite easy.

The main tool I use is mezzanine - one of the people I worked with on the cAos Linux distributions wrote this toolset in perl, and it is installable even on debian-based distros.  His website is experiencing issues at the moment but it is <a href="http://beta.kainx.org/" title="http://beta.kainx.org/">http://beta.kainx.org/</a>.  If it's still down and you want the rpm, rpm.pbone.net can find you an rpm.

The basics are that you need a folder that contains an "F" "P" and "S" directory, and yes, that is all uppercase.  The F folder contains a spec file similar to what's below, the S folder contains the source files and the P directory is a clever little patch making system.

The spec file is almost exactly the same as a normal rpmbuild spec file and looks like this :-
<code>
#
# spec file for safe-rm
#
Summary: Don't rm various directorie
Name: safe-rm
Version: 0.8
Release: 1
License: GPL
Group: Applications/Utilities
Source: https://launchpad.net/safe-rm/trunk/0.8/+download/safe-rm-0.8.tar.gz
URL: https://launchpad.net/safe-rm
Distribution: CentOS
Packager: Martyn Ranyard <info@edmondscommerce.co.uk>
Patch1000: safe-rm-0.8-example-conf.patch
Requires: perl

%description
Stop people accidentally removing directories with rm -rf

%changelog
* Thu Aug 09 2012 Martyn Ranyard <info@edmondscommerce.co.uk>
- Used the debian example config for the default config

%prep
rm -rf $RPM_BUILD_ROOT/safe-rm-0.8
zcat $RPM_SOURCE_DIR/safe-rm-0.8.tar.gz | tar -xvf -
cd safe-rm-0.8
%patch1000 -p1

%build

%install
mkdir -p $RPM_BUILD_ROOT/usr/bin/
mkdir -p $RPM_BUILD_ROOT/etc/
mkdir -p $RPM_BUILD_ROOT/sbin/
install -m 0755 safe-rm-0.8/safe-rm $RPM_BUILD_ROOT/usr/bin/safe-rm
install -m 0644 safe-rm-0.8/safe-rm.conf $RPM_BUILD_ROOT/etc/safe-rm.conf
cd $RPM_BUILD_ROOT/usr/bin/
ln -s safe-rm rm
cd -
cd $RPM_BUILD_ROOT/sbin/
ln -s /usr/bin/safe-rm rm
cd -

%files
/etc
/etc/safe-rm.conf
/usr
/usr/bin
/usr/bin/safe-rm
/sbin
/sbin/rm
</code>

You'll notice the patch1000 lines reference a patch file, which mezzanine handily creates for you, first you run mzprep, which creates a work dir, then you add/edit files in there to make whatever you're packaging build and install (to $RPM_BUILD_DIR) and then you run "mzpatch mypatchname.patch" and it creates the patch ready to be deployed.

To create the rpms, change back to the top level directory (the one containing F P & S) and type mzbuild.

It takes a bit of getting used to and a fair bit of fiddling but the end result is good solid rpms.

Note: it can also make deb files and slackware package files but KainX is the guy to talk to on that front.
