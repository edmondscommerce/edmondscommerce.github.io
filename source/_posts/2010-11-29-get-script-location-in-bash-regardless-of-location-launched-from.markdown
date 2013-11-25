---
layout: post
status: publish
published: true
title: Get Script Location in Bash Regardless of Location Launched From
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1938
wordpress_url: http://www.edmondscommerce.co.uk/?p=1938
date: 2010-11-29 12:53:16.000000000 +00:00
categories:
- php
tags:
- php
- path
- bash
- script
- location
- portability
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Bash scripts are often used to work on files and the current working directory is of paramount importance. 

However, you may have scripts that are running in a development environment and also a live environment with different folder setups.

To help with portability and remove the requirement to hard code paths, you can use this little snippet

```

DIR="$( cd "$( dirname "$0" )" && pwd )"

```

For example, I have a system all running from a folder with one subfolder called processes (where my scripts are located) and another folder called launcher which actually handles the application.

The processes scripts generally launch a sequence of actions in one go.

Here is how I am using the above snippet

```


#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

cd $DIR

cd ../launcher

pwd

./shellLauncher.php Scraper importCsvFile

./shellLauncher.php Scraper scrapeNewProducts


```

This script cd's to the script location first (the processes sub folder) then goes back up the folder structure and into the launcher folder before launching the individual actions that make up this process.
