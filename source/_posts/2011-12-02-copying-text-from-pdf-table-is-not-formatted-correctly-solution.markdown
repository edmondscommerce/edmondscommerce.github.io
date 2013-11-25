---
layout: post
status: publish
published: true
title: Copying Text from PDF table is not formatted correctly + solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2747
wordpress_url: http://www.edmondscommerce.co.uk/?p=2747
date: 2011-12-02 17:41:53.000000000 +00:00
categories:
- ubuntu
tags:
- linux
- table
- solution
- pdf
- tip
- text
- extract
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you need to extract the information from a PDF table sometimes when you copy and paste it into a text editor the formatting is incorrect making the information useless.

In cases like this, you can use pdfedit to extract the text in the correct formatting and then do what you need with it.

To use the program first make sure it's installed. If not install it like this 

<code>
sudo apt-get install pdfedit
</code>

then use it to open the PDF. Click through the the correct page and then click Page -> Extract Text From Page
