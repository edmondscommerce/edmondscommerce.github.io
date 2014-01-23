---
layout: post
status: publish
published: true
title: Ubuntu Git Install 1.7.5 and Why
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2319
wordpress_url: http://www.edmondscommerce.co.uk/?p=2319
date: 2011-06-09 12:42:13.000000000 +01:00
categories:
- git
tags:
- ubuntu
- linux
- upgrade
- git
- script
- ppa
- merge
- whitespace
- repository
- apt
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you use Git a lot, you probably want to run the latest version. Scroll down for some reasons why.

The standard repository version for Ubuntu is 1.7.1, the current latest is 1.7.5 and there are some significant differences.

<h2>How to Upgrade Git</h2>
To get 1.7.5 on Ubuntu without too much messing about you can do the following:

<h3>1. Set up this PPA:</h3>
```

sudo add-apt-repository ppa:pdoes/ppa/ubuntu

```

<h3>2. Now run an aptitude update and upgrade git</h3>
```

sudo apt-get update
sudo aptitude upgrade git

```

<h3>3. Now check your git version</h3>
```

git --version

```

<h3>Full Script for the lazy</h3>
```

sudo add-apt-repository ppa:pdoes/ppa/ubuntu && sudo apt-get update && sudo aptitude upgrade && git --version

```

<h2>Why Upgrade Git?</h2>
We have been having lots of merge hassles casued purely by white space changes. Apparently with 1.7.4 new recursive merge strategies came into play that should alleviate this pain and make merging a lot less hassle.

<h3>Merge Ignore Whitespace</h3>
```

git merge -s recursive -Xignore-space-change $BRANCH_NAME

```

Less hassle equals more productive and happier developers :)
