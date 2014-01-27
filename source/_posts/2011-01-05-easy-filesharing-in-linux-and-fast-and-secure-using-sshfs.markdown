---
layout: post
status: publish
published: true
title: Easy Filesharing in Linux (and Fast and Secure) using SSHFS
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1983
wordpress_url: http://www.edmondscommerce.co.uk/?p=1983
date: 2011-01-05 13:44:14.000000000 +00:00
categories:
- linux
tags:
- ubuntu
- linux
- ssh
- access
- sshfs
- filesharing
- remote
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are frustrated with Samba and would like something a bit more solid and speedier whilst being very easy to set up, check out SSHFS.

To install it you simply need to do 

```

sudo apt-get install sshfs

```

Once that's done you can mount a remote filesystem in a very similar way to accessing a remote machine via SSH

eg

```


#Mount
sshfs  -p2020 -o idmap=user $USER@laptop.com:/home/joseph/Projects ~/Mounts/Laptop/Projects

#Unmount
fusermount -u ~/Mounts/Laptop/Projects


```

You need to have previously created the local folder you are going to mount to (in this case /home/joseph/Mounts/Laptop/Projects)

Note also I am using a non standard SSH port with the -p2020 bit (using port 2020). If you are using standard SSH ports you can remove this, or of course change the port number to whatever you prefer.

<a href="https://help.ubuntu.com/community/SSHFS">https://help.ubuntu.com/community/SSHFS for more info</a>
