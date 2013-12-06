---
layout: post
status: publish
published: true
title: Using TCPDF with Magento
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3000
wordpress_url: http://www.edmondscommerce.co.uk/?p=3000
date: 2012-02-27 13:46:00.000000000 +00:00
categories:
- magento
tags:
- php
- zend framework
- magento
- solution
- pdf
---
Magento's Zend extension for creating pdfs could take massive amount of time to customize, I would say customizing the code to make it do what you want is not the best the way to go when an entire layout changes is to be made to probably for invoice, packing slip etc. I found an extension that you could add to Magento to make things a lot easier by creating pdf's from html called TCPDF. There exist other extension that could do the same thing e.g. DOMPDF, when I tried incorporating DOMPDF with Magento, it broke my browser and won't generate anything. Dompdf could actually still work with Magento but I didnt have the time to probe into what could be wrong.

So I settled into using TCPDF which worked beautifully with Magento in minutes. You can incorporate it easily into Magento by following the steps below;
1. Download TCPDF from http://sourceforge.net/projects/tcpdf/files/
2. Change the name of the file root directory after extraction to TCPDF
3. Inside this directory, there is a tcpdf.php file, change the name to TCPDF
4. Open the file and change the class name from tcpdf to TCPDF_TCPDF, am very sure those that are really familiar with Magento will know why.
5. Copy the files into your Magento "lib" folder in the root Magento installation directory.
6. And you have successfully incorporated TCPDF with Magento, from anywhere in Magento, you can call this class by  $tcpdf = new TCPDF_TCPDF(), you can find the constructor parameters for this class in the example files in the TCPDF directory.

I hope this helps someone.
