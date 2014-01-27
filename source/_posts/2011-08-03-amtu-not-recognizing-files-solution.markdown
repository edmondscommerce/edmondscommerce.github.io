---
layout: post
status: publish
published: true
title: AMTU Not Recognizing Files + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2524
wordpress_url: http://www.edmondscommerce.co.uk/?p=2524
date: 2011-08-03 18:30:17.000000000 +01:00
categories:
- linux
tags:
- linux
- problem
- amazon marketplace
- amtu
- ecommerce
- solution
- install
- amazon
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
I've recently had to upgrade a shop that lists products on amazon. They wanted to automatically add new products and keep their inventory up to date, so I set up a feed generating system and installed AMTU to send the data through to amazon.

After putting together a test run I saw that the Inventory Uploader was being sent to to the failed folder. The only clue about this was in the audit logs where it said
<code>
2011-08-03 16:02:20,062 INFO  Could not recognize file amazon_amtu_price_quantity.txt - ignoring.
</code>

After a lot of looking around, it appears that AMTU require the top line on the feeds that starts TemplateType=... If this is missing the system flags the file as unknown, and refuses to send it. To make things worse, trying to get round this by using a different template type causes amazon to reject the file on their end.

To fix this I started to look online to find a solution. Everything that I could find referenced the 1.0.9 AMTU version that I was using, and it was only by accident that I discovered that Amazon had quietly released an update to the program earlier this year. This new, AMTU 2.0, accepts all of the new file types, offers more intergration with the fulfilment by amazon service and is simple to install.

So others don't have to spend as much time as I did, this is what you need to do to install it.

Stop and uninstall your previous version of AMTU. To do this you need to ensure that the JAVA_HOME variable is set in bash. To check this type
<code>
echo $JAVA_HOME
</code>
If something is displayed, then the variable is set, if not then you will need to set it. Find where your java home directory is, mine was in /usr/java/latest/, if yours is not there type the following
<code>
find / -name java 2>/dev/null
</code>
This will give you a list of directories, you're looking for one that a /bin folder inside it. 

Now that you have the directory, you need to set the variable. The best way is to edit /root/.bash_profile and add in the following line
<code>
export JAVA_HOME="/path/to/dir/"
</code>
However this require you to log out, or restart the server. If this isn't possible, type the same line on the command line and it will set the variable for the rest of the session.

Once everything is set up, go to your AMTU folder, /opt/amtu/ in my case, and run the uninstall.sh script. This will remove amtu, but leave the files you've already generated.

Next download the appropriate version from this <a href="https://sellercentral.amazon.co.uk/gp/help/help-page.html/ref=ag_16481_cont_32911?isLink=1&itemID=16481">page</a>, or if setting up on a server use the following code
<code>wget https://d28hcfptedr5ia.cloudfront.net/install/AMTU_unix.sh</code>

make sure the file is executable and then run it. Fill in the information that is asked for and you're good to go. When you set it up, you'll be asked for your MWS details. If you are running the installation on a desktop, then it will provide you with a link that you can click and register. Once you have set everything up, you can export your settings, by running the following command
<code>
/path/to/amtu/Utilities/configure EXPORT /tmp/config.xml
</code>
you can then move the config file onto the server and run import the file, using SETUP instead of EXPORT.

Once all of this is done, your system is ready to go. I hope this will save someone some time
