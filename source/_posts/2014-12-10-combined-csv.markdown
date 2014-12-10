---
layout: post
title: "Combined CSV"
date: 2014-12-10 17:23:36 +0000
comments: true
author: joseph
categories: 
 - bash
tags: 
- bash
- combine
- file
- csv
description: "Here's a quick one liner to combine a folder of csv files into one single file with one header row"
---

Here is a quick BASH one liner to combine a folder of csv or similar files into one combined file with a header.

``` bash
h=0; for f in *; do if [[ 0 != $h ]]; then tail -n +2 $f >> combined.txt; else cat $f > combined.txt; h=1; fi done
```

More readably, you can see it like this:

``` bash
# has header been set, starts as no
h=0; 
# foreach file in current directory
for f in *
do 
    # if header has been set
    if [[ 0 != $h ]]
    then 
        # append the contents of the file starting from line 2 into the combined file
        tail -n +2 $f >> combined.txt
    else 
        # overwrite the combined file with the contents of the file, including header
        cat $f > combined.txt
        # and mark the header as having been set
        h=1 
    fi 
done

```

That's it, pretty easy really
