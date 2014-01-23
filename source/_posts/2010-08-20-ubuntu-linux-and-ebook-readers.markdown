---
layout: post
status: publish
published: true
title: Ubuntu Linux and eBook Readers - Crop your PDFs
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1782
wordpress_url: http://www.edmondscommerce.co.uk/?p=1782
date: 2010-08-20 19:39:31.000000000 +01:00
categories:
- ubuntu
tags:
- linux
- ebook
- pdf
- crop
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
I've just taken delivery of a nice new eBook reader

here's my must have info for the moment:

1. Calibre - FOSS eBook management

<a href="http://calibre-ebook.com/download_linux">http://calibre-ebook.com/download_linux</a>

2. Stripping the margins out of PDF files
You will quickly notice when reading PDF files that you are wasting valuable screen space with large margins designed for printed paper. You want to strip these away completely.

Luckily we have an excellent app to take care of it.

```

sudo aptitude install texlive-extra-utils

```

now if you want to strip a PDF of its pointless margins, just run in the shell:
```

pdfcrop filename.pdf

```

that's it!

Warning though, it does use a lot of processing power and isn't particularly fast. It's a heavy operation so maybe leave it running over night or something.

If you wanted to run it on a few pdfs at a time, you might try this.

```

find /path/to/pdfs -type f -name '*.pdf' -execdir pdfcrop {} \;

```

definitely an over night one though!
