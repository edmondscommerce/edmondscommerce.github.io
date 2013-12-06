---
layout: post
status: publish
published: true
title: Using Magento with Amazon EC2
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 4101
wordpress_url: http://www.edmondscommerce.co.uk/?p=4101
date: 2013-03-07 16:14:08.000000000 +00:00
categories:
- magento
tags:
- magento
- amazon
- ec2
---
<h3>What EC2 is and how it differs from standard hosting</h3>

Aside from shared hosting, Virtual Private Servers and Dedicated Servers, another form is cloud hosting. EC2 is Amazon's answer to this

EC2 allows you to run "instances" which are prebuilt images which from your perspective is just like a virtual machine. The difference being that it's in no way fixed to a physical machine, or even datacentre.

<h3>Using Magento with EC2</h3>

Obviously there are prebuilt images for various platforms (Ubuntu, CentOS, Debian etc) and Magento can be installed on these as with any server.

If you'd like to avoid that Bitnami provides a very nice Magento EC2 instance which has Magento running out of the box, and it's really the best way to get started with Magento on EC2.

One issue we have previously hit is the machine reporting itself to be out of disk space, but actually the issue was down to running out of what are known as inodes. We've <a href="http://www.edmondscommerce.co.uk/magento/magento-not-working-not-creating-report-files-either-solution/" title="documented this previously">documented this previously</a>, but should be a very rare case
