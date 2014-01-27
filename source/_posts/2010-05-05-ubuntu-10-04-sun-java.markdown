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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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



