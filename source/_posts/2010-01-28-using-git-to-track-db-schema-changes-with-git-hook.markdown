---
layout: post
status: publish
published: true
title: Using Git to Track DB Schema Changes with Git Hook
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1333
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1333
date: 2010-01-28 10:48:29.000000000 +00:00
categories:
- git
tags:
- git
- hook
- pre-commit
- mysqldump
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you use Git for version control and you would like to also keep a track of your database schema (and possibly content though I'm not doing that due to potential file sizes / speed issues) then all you need to do is this simple step:

1. Go to your project folder and into the hidden .git folder, then a sub folder in there called hooks
```
 cd .git/hooks 
```

2. Create a file called pre-commit and open it in vim (or whatever text editor you like)
```
 vim pre-commit 
```

3. Add a mysql dump command to that file and save it 
```

#!/bin/sh
mysqldump -u DBUSER -pDBPASSWORD  DATABASE --no-data=true > SQLVersionControl/vc.sql
git add SQLVersionControl/vc.sql
exit 0

```

(note this assumes you have a folder called SQLVersionControl in the root of your project. If you don't just create it.)

No without any further effort, you will update the schema file on every commit.

eg 
```

git commit -am 'this commit will include a mysql schema dump that has been run just before the commit - sweet :)'

```
