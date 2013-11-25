---
layout: post
status: publish
published: true
title: Yii Setting up Authorisation - the Missing Manual
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2925
wordpress_url: http://www.edmondscommerce.co.uk/?p=2925
date: 2012-02-01 17:25:50.000000000 +00:00
categories:
- php
tags:
- mysql
- php
- database
- tutorial
- solution
- framework
- yii
- auth
- manager
---
Reading the generally very clear and concise Yii documentation you can quickly get started with the framework.

However one issue that I struggled to be clear on is setting up the database driven authorisation system.

I recommend reading <a href="http://danaluther.blogspot.com/2010/03/yii-authentication-via-database.html">this blog post</a> which finally helped me to understand wth I was supposed to do. The official documentation is <a href="http://www.yiiframework.com/doc/guide/1.1/en/topics.auth#defining-authorization-hierarchy">here</a> which you should also read.

There are a few key points that are not really clear but are important.

<strong>1. You need to create the tables.
</strong>
There is a file: yii/framework/web/auth/schema-mysql.sql 

You need to run this on your database to build the necessary tables#


<strong>2. Creating the rules - use the Yii Shell
</strong>
You will see examples of PHP code that defines rules etc. You may wonder where the hell you are supposed to put this code and also is it really a good idea to run this kind of code on every page load, seems odd.

Well the answer is you are only meant to run it once and you can either make a PHP script that runs it or even nicer is to use the Yii interactive shell and paste the lines in one at a time to execute them.

<strong>Using the Yii Shell</strong>

Go to your web root on the command line (I'm using Linux, good luck if you aren't)
```

cd ~/Projects/yii-projects/public

```

Now run the yiic tool from the web root with the shell flag
```

protected/yiic shell

```

You now have an interactive PHP shell with the Yii framework available. You can create models, crud etc as you might have done in Gii, but you can also run PHP code directly, including working with Yii objects - such as the authManager

Try this:

Paste this line into your Yii shell and hit return
```

$auth=Yii:app()->authManager;

```

Then this line and hit return
```

var_dump($auth);

```

You should see a var dump of the CDbAuthManager object

Now when you see examples such as this:
```php

$auth=Yii::app()->authManager;
 
$auth->createOperation('createPost','create a post');
$auth->createOperation('readPost','read a post');
$auth->createOperation('updatePost','update a post');
$auth->createOperation('deletePost','delete a post');

```

You realise that this is something you can do ONCE to set up these roles, and a great way to do that is via the Yii Shell.

Have fun ;)
