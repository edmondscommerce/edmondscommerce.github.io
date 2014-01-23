---
layout: post
status: publish
published: true
title: Setting Up Amazon's AMTU on a Linux Server
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 249
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=249
date: 2009-03-23 16:52:54.000000000 +00:00
categories:
- ecommerce
tags:
- amazon marketplace
- sellercentral
- amtu
- xml integration
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Amazon helpfully supply a java package called AMTU which does the grunt work of the XML integration for Amazon marketplace. With AMTU you can easily update products, stock levels, prices and also grab order info etc.

Being based on Java, AMTU can run on pretty much any operating system. It uses a "hot folder" system so integration with client systems is as simple as dropping files into certain folders.

There are some good instructions for setting up AMTU on windows. That's great if you want to run it on your desktop (or a windows server if you are that way inclinded.... :-) ). However if you are one of my clients you are running a Linux server and need it setting up on there.

Unfortunately the documentation for AMTU on Linux is pretty lightweight. This blog post aims to help out anyone struggling with getting AMTU working on their server.

Before you start. Open up the README file (just download the package to your local machine). Have a quick read through and then understand that the README is simply wrong. It is a guide at best, but not strict instructions. They definitely haven't made it easy for us.

Speaking to Amazon about this, it is apparent that AMTU was developed by someone who is no longer around to support it. They have released it as open source software and basically left us to it. They are not willing to support it themselves. 

Here's my instructions:

<strong>1. Log into SSH as root on your server.</strong>
Using your favourite SSH client. If you use linux you can just use the terminal, definitely my favourite way of handling SSH.

<strong>2. Navigate to the root folder that you want to install AMTU to.</strong>
```
cd /opt
```

<strong>3. Download the AMTU Files</strong>
```

mkdir amtu

cd amtu

wget http://freefr.dl.sourceforge.net/sourceforge/amtu/amtu-linux-1.0.9.tar.gz

```

<strong>4. Unpack the Archive</strong>
```

tar -xvf amtu-linux-1.0.9.tar.gz

```

<strong>5. Edit the config files</strong>

	<strong>5.1</strong> Find your JAVA_HOME

	This may change depending on what version of Linux you are using. If you are not sure then use the following command to find out:

	```
cat /etc/issue
```

	The following command will show you which Java version you are running. If you are it doesn't work then it looks like you don't have Java installed. Please see <a href="#aa"><b>Apendix A</b></a> for Java install instructions.
	
	```
 java -version
```
	
	You need to find out the exact path for java. You can use this command:
	
	```
find / -name java
```
	
	This will display a few lines. There is usually only one Java folder though with the others being symlinks (shortcuts kind of ) to the Java folder.
	
	<strong>5.2 Edit the Install.sh File</strong>
	
	First get into the AMTU folder:
	
	```
 cd /opt/amtu/
```
	
	Now make sure you have your path to the JRE noted down somewhere and open up the install.sh for editing. For me the path is /usr/bin/java
	
	```
 vi install.sh
```
	(vi is a text editor for linux. If you are not familiar with it simply search for "vi common commands or something like that).

	Now go to the top of the file and add a new line. Replace /usr/bin/java with your own path to Java.
	
	```

	export JAVA_HOME=/usr/bin/java
	
```

<strong>6. Run the Install Script</strong>

First we need to make the install script executable.
```
 chmod a+x install.sh
```

Now run the install script. 
```
./install.sh
```

<strong>7. Configure AMTU</strong>

This is where it gets interesting. AMTU is installed, but you haven't given it any kind of information regarding your Amazon account so how will it be able to connect to your specific account??

You need to use the configure.sh script to do this. For me this wouldn't work until I edited it and ran it manually. There is a configure.sh in the root amtu folder, however all this seems to do is run the configure script in the service folder. 

Lets go straight to the service folder and get that one working.

```

cd /opt/amtu/service/bin

vi configure.sh

```

In this file they are mixing up the JAVA_HOME variable and appending /bin/java to it. I'm not really sure why they would do this. 

First of all try running the script

```

./configure.sh

```

If you get an error like: 

./configure.sh: line 3: /bin/java: No such file or directory

Then you will need to edit the file. For me to get it to work I had to remove the following:

<blockquote>$JAVA_HOME/bin/java</blockquote>

and simply replace it with my path to Java which is:

<blockquote>/usr/bin/java</blockquote>

Then run the script again and it will ask you a bunch of questions. For most questions the default answers seem fine to me. You will need to know your SMTP details. You will want to log into your seller central account as well so that you can copy relevant details from there.

If it is all successful you should get a message similar to the following:

<blockquote>Please standby while your account details are verified...
Ping was successful
Updating configuration... done!

To alter this configuration, please use the Configuration Utility in the directory you installed this application.

Exiting Application</blockquote>

<strong>8. Starting the AMTU and Monitor services</strong>
To start the amt and amt_monitor services you need to manually start them. You can also check the status of these processes.

First get into the bin folder
```

cd /opt/amtu/service/bin

```

check status
```

./amt status

./amt_monitor status

```

If they are not started simply run the start commands
```

./amt start

./amt_monitor start

```

Running these two commands should have created some folders in your DocumentTransport folder. To check this out simply go to the folder and check
```

cd /opt/amtu/DocumentTransport

ls

```

You should see a folder called logs and a folder called production. The production folder contains our Hot Folder for sending files up to Amazon.


<strong>7. Set up symlinks</strong>
Once everything is working nicely, you will probably want to create symlinks from folders accessible by PHP. 

Navigate to the place that PHP can access and which you would like to place a symlink to the production/outgoing folder. Then use the following command - replace the details as necessary

```

cd /home/path/to/php/accessible

ln -s /opt/amtu/DocumentTransport/production/outgoing my_amtu_symlink_folder_name

```

<strong>8. Test it Out</strong>
All you need to do to test it out is to drop a file into the /opt/amtu/DocumentTransport/production/outgoing folder (or the symlink to this folder that you have just created). Then wait 5 minutes (cup of tea time) and come back. Now browse through the production folders. If the file is in the /sent folder then your upload has worked OK. If it is in the /failed folder then something has gone wrong. 

If like me it didn't work (surprise surprise) then you need to examine the log files to find out what the problem is. The best log to look in to start with is the audit_log.

```

cd /opt/amtu/DocumentTransport/logs
vi amtu_audit.log

```

To go to the bottom of the file use the vi shortcut ```shift
+[g]

As for figuring out exactly why AMTU doesn't like your feed file, I leave that bit to you.



<hr>
<a name="aa"></a>
<strong>Appendix</strong>

<strong>A. Install Java</strong>

These are instructions for a CentOS Linux install. Your Linux might be a different flavour. Simply search around for instructions for your specific setup.

<strong>A.1 Download JRE</strong>

	Go <a href="http://java.sun.com/javase/downloads/index.jsp">to the Java downloads page</a>
	Find the link to the Linux Java JRE bin. (For CentOS you need the rpm version). Copy the link to your clipboard

	[code]
	cd opt
	wget {link from clipboard for JRE download}
	
```

	This will download the file. However as it is accessed via a script, it will give it a crazy long filename. Lets just rename that first. To rename a file with special characters simply wrap the filename in "" otherwise it won't work.

	```

	ls
	
```

	now copy the filename to your clipboard

	now paste it into this command 

	```
 mv "filename from clipboard" jre-rpm.bin 
```

	Now we need to set the file as executable

	```
 chmod a+x jre-rpm.bin
	
```

	Now we install it 

	```

	./jre-rpm.bin
	
```

	This will then flash up a bunch of terms and conditions. Just hold down [return] until you get to the bottom, then type "yes".

	To check its all installed use the command 
	```
 java -version
```

	You should get something similar to the following:

	java version "1.6.0_12"
	Java(TM) SE Runtime Environment (build 1.6.0_12-b04)
	Java HotSpot(TM) Server VM (build 11.2-b01, mixed mode)


<b>References</b>
<a href="http://blog.sixsigns.com/2008/02/12/installing-the-latest-jre-6-on-centos-5/" rel="nofollow">installing the latest jre on centos 5</a>
<a href="http://amtu.sourceforge.net/" rel="nofollow">AMTU Homepage</a>
<a href="http://sourceforge.net/forum/forum.php?forum_id=405856" rel="nofollow">AMTU Forum - not much of use in there unfortunately</a>
<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://www.scottfillmer.com/2009/03/05/amazon-marketplace-sellers-no-more/" rel="nofollow"><b>Amazon Marketplace</b> Sellers No More | Scott Fillmer :: Serving <b>...</b></a><br><a href="http://www.articlegenesis.com/blog/2009/03/23/how-does-amazons-shipping-policy-work-for-marketplace-books/" rel="nofollow">ArticleGenesis - A PLR Articles Library » Blog Archive » How does <b>...</b></a><br><a href="http://novirusthanks.org/blog/?p=531" rel="nofollow">Trojan.Win32.Dialer spread through IE7 0-Day Exploit</a><br><a href="http://www.kevinblake.co.uk/getting-document-reports-from-amazon-seller-central-soap-services-c/457/" rel="nofollow">Getting document reports from Amazon <b>Seller Central</b> SOAP services <b>...</b></a><br><a href="http://www.smallbusinessgrowthblog.com/your-own-business/how-do-i-find-something-to-sell/" rel="nofollow">How do I Find Something to Sell?</a><br><a href="http://www.kevinblake.co.uk/travel-map-countries-visited/460/" rel="nofollow">Travel map - countries visited » Kevin Blake&#39;s Blog</a><br><a href="http://motivated-sellers.net/blog/?p=1" rel="nofollow">What are motivated sellers?</a><br><a href="http://grqscamsrevealed.com/blog/?p=55" rel="nofollow">How do I Find Something to Sell?</a><br><a href="http://coenraets.org/blog/2009/03/springblazeds-integration-test-drive-m2-update-available/" rel="nofollow">Christophe Coenraets » Blog Archive » Spring/BlazeDS <b>Integration</b> <b>...</b></a><br></div>
