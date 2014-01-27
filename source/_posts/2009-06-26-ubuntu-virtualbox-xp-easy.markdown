---
layout: post
status: publish
published: true
title: Ubuntu + VirtualBox + XP = Easy
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 816
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=816
date: 2009-06-26 08:39:51.000000000 +01:00
categories:
- ubuntu
tags:
- web design
- internet explorer
- ubuntu
- virtualbox
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
I have recently had the misfortune of stepping out of my usual developers bubble and having to do a bit of graphic web design. Of course that means that not only did I have to try to make something look good with my meagre design skills, but then I had to worry about making sure it worked in IE...

Web Designers... I FEEL YOUR PAIN

As I only use Ubuntu or Mac's, testing in IE is not exactly easy. Or at least it wasn't until I decided to take the plunge and set up XP as a virtual machine. It's really really easy on Ubuntu.

1. Go to the Applications->Add / Remove system

2. type virtualbox in the searchbox

3. Install VirtualBox OSE

4. Go to the Applications->Accessories menu and launch VirtualBox OSE

5. Hit the blue New icon in the top left

6. Follow the wizard. I used the following settings:

6.a name: xp

6.b: memory: 192mb

7. At the boot disk stage, you need to hit the New button to create and install a new 'boot disk'.

8. Whack your XP CD in the drive and install it. 

By default the right hand ctrl key is your key for escaping out of your virtual machine. This means that if you click on your virtual machine with your mouse (for example to go through to multiple steps required to tell XP that you want English UK keyboard, and surprise surprise an English Keyboard layout and furthermore you don't really need to install English US as a separate language)

Note - to access your Ubuntu environment you will need to have folder sharing set up, the virtual machine will see the host Ubuntu like another computer on a network.

If like me you need to edit the hosts file to point a dummy domain to your local development environment, the IP address you need to use is 10.0.2.2
