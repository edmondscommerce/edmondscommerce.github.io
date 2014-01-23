---
layout: post
status: publish
published: true
title: Ubuntu 10.04 Sun Java
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1632
wordpress_url: http://www.edmondscommerce.co.uk/?p=1632
date: 2010-05-05 17:31:35.000000000 +01:00
categories:
- ubuntu
tags:
- ubuntu
- '10.04'
- sun
- java
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Ubuntu 10.04 upgrade seems to have nuked my Java and Netbeans

Here's how I got it all back:

Get Sun Java

```

sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"

sudo apt-get update

sudo apt-get install sun-java6-jre sun-java6-plugin sun-java6-fonts


```

Now you need to check the path to sun java from the list output:

```

sudo update-alternatives --list java

```

and now set the path for sun java:
```

sudo update-alternatives --set java {COPY AND PASTE SUN JAVA PATH HERE}

```

now to check its using the correct version

```

java -version

```



