---
layout: post
title: "Merging Forks for Composer"
date: 2013-12-05 19:53:16 +0000
comments: true
author: joseph
categories: 
 - composer
tags: 
 - github
 - git
 - symfony
 - composer
 - fork
 - merge
description: "How to combine forks into one repo for Composer"
---

I am really enjoying using Composer with a Symfony2 project that I am currently working on.

Recently though I found an issue where I am using the FOSRest Bundle to provide JSON API functionality. This in turn uses the
JMS/SerializerBundle to handle the actual encoding into JSON.

The problem is that the JMS bundle converts camelCase to snake_case and I decided I really didn't want that. I want my property and entity names to be the same across formats.

A bit of digging and I found [this fork](https://github.com/passkey1510/JMSSerializerBundle) which features a fix for exactly this problem, brilliant!

However on trying to get this to install with Composer I simply could not get it to work. Further investigation shows that the version of the JMS bundle that this fork does not meet
the minimum version requirements of the FOSRest bundle. Problem.

The solution in the end was to fork the JMSSerializerBundle Directly then pull this down locally. Once I had that locally I then added the fork with the fix I need as another remote:

```
git remote add passkey1510 git@github.com:passkey1510/JMSSerializerBundle.git
git merge remote/passkey1510/master
git push
```

Those three commands added the other fork as another remote allowing me to pull in the commits that feature the fix I need. Finally I pushed this back up to github.

I can now reference my fork in my composer.json file like this:

```
"repositories": [
        {
            "url": "https://github.com/edmondscommerce/JMSSerializerBundle.git",
            "type": "vcs"
        },
],
```

Now running a ``composer update --dev`` and composer successfully brought in my fork of the Serializerbundle with the extra fixes to allow the property names to stay in camelCase.

And that is it, problem solved :)
