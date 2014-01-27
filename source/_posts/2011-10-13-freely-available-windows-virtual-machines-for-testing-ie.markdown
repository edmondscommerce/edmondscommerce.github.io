---
layout: post
status: publish
published: true
title: Freely Available Windows Virtual Machines for Testing IE
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2681
wordpress_url: http://www.edmondscommerce.co.uk/?p=2681
date: 2011-10-13 18:06:26.000000000 +01:00
categories:
- linux
tags:
- web
- development
- design
- browser
- internet explorer
- ie
- testing
- virtualbox
- Windows
- image
- vdi
- free
- windows 7
- xp
- IE7
- IE8
- IE9
- virtualisation
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you need to test your code against the (ahem) interesting interpretations of the various iterations of Internet Explorer then this is a great resource for you.

Turns out Microsoft have thrown web devs a bone by offering free virtual machine images with the various IE/OS flavours for you to test on. You can download them <a href="http://www.microsoft.com/download/en/details.aspx?id=11575">here</a>.

If you use VirtualBox and also a *nix based operating system such as Linux or OSX then you can use <a href="https://github.com/xdissent/ievms">this, frankly awesome, bash script</a> to automatically download one or all of these machines and fully set them up in VirtualBox for you.

VirtualBox, if you are not aware, is a freely available Virtualisation platform allowing you to run other operating systems on your desktop. On todays powerful machines its perfectly easy to run Linux as your core operating system and then for either running windows only apps or for testing dodgy browsers, you can fire up one of these VMs.

Bear in mind that they are not for keeps, you will need to reset them every 30 days due to the fact that they can not be activated. For our purposes though this is not really a problem.

<h2>Usage</h2>
Please note all of this has been copied and pasted from <a href="http://www.webupd8.org/2011/09/test-websites-in-internet-explorer-9-8.html">here</a>. Posted here for reference only, all original attribution and credit goes to webupd8.

1. Before proceeding, make sure you have the latest VirtualBox installed - you can find Ubuntu installation instructions HERE. You'll also need "curl" (for both Linux and OSX) and "unrar" (Linux only). In Ubuntu, install them using the command below:
```

sudo apt-get install curl unrar

```


2. To download and run the CODE, use the following command in a terminal:
```

curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | bash

```
If you want to check out the bash source before running it, you can find it @ GitHub.

The above command will download Windows WHDs for IE7, IE8 and IE9. If you only need one Internet Explorer version, you can run:
```

curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="9" bash

```
Where "9" is the IE version you want (you can also add two versions here, like "7 9").

At this point, the download should start and it will take a while so be patient.
