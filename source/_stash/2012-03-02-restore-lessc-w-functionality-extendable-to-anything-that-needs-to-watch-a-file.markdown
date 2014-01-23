---
layout: post
status: publish
published: true
title: Restore lessc -w functionality, extendable to anything that needs to watch
  a file.
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3031
wordpress_url: http://www.edmondscommerce.co.uk/?p=3031
date: 2012-03-02 12:25:46.000000000 +00:00
categories:
- linux
tags:
- Cascading Style Sheets
- ubuntu
- files
- tip
- less css
- ruby
- inotify
- watch
---
The latest version of the less compiler in ruby has reduced the functionality of watching a file, so we wrote this little script (which we put in ~/bin/lessc-w) to restore the old functionality :

```

#!/bin/bash

LESSFILE=$1
CSSFILE=`basename $1 .less`.css

if [ "$2" != "-f" ]; then
    if [ "`file -b $LESSFILE`" != "ASCII text" ]; then
        echo "file $1 doesn't look like a less file...., looks like a `file -b $LESSFILE`";
        echo "usage: lessc-w lessfile.less [-f]";
        exit
    fi
fi

while true; do
    inotifywait -e modify $LESSFILE && \
    echo "Rebuilding styles" && \
    lessc $LESSFILE > $CSSFILE
done

```

As you can see it's very simple to tweak this to any program that needs to be run when a file is changed.
