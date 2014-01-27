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
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
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
