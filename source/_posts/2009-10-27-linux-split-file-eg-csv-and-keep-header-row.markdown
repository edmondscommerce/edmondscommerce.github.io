---
layout: post
status: publish
published: true
title: Linux Split File (eg CSV) and Keep Header Row
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1219
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1219
date: 2009-10-27 15:04:37.000000000 +00:00
categories:
- linux
tags:
- linux
- file
- csv
- split
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Linux has a great little utility called split, which can take a file and split it into chunks of whatever size you want, eg 100 line chunks.

However, for CSV files etc, each chunk generally needs to have the header row in there. Unfortunately the split command doesn't have an option for that. However with a little bit more code you can achieve it.

```

tail -n +2 file.txt | split -l 4 - split_
for file in split_*
do
    head -n 1 file.txt > tmp_file
    cat $file >> tmp_file
    mv -f tmp_file $file
done

```
