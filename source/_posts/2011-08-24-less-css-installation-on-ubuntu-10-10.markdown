---
layout: post
status: publish
published: true
title: Less CSS Installation on Ubuntu 10.10
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2595
wordpress_url: http://www.edmondscommerce.co.uk/?p=2595
date: 2011-08-24 17:00:13.000000000 +01:00
categories:
- less css
tags:
- web design
- Cascading Style Sheets
- ubuntu
- linux
- less css
- gems
- rubygems
- ruby
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Our last post on getting less css doesn't work any more for installing less css on 10.10, due to changes in rubygems and ubuntu/debian, so here's some updated instructions that work again!
```
sudo apt-get install rubygems1.8 ruby1.8-dev
sudo gem install rubygems-update
sudo gem update rubygems
sudo gem install less
```

And also remember that you have to either have your gems binaries in your path or symlink the lessc into somewhere that's in your path, eg. like this
```

sudo ln -s /var/lib/gems/1.8/bin/lessc /usr/bin/

```
