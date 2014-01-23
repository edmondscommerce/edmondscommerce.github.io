---
layout: post
status: publish
published: true
title: Building Bash function libraries
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2267
wordpress_url: http://www.edmondscommerce.co.uk/?p=2267
date: 2011-05-27 10:04:15.000000000 +01:00
categories:
- programming
- linux
- ubuntu
tags:
- git
- functions
- bash
- scripting
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Bash provides many powerful functions but how can you use these easily?

If you spend any time using the command line, either to manage a server or on the desktop, you have to quickly become proficient with bash. You will also find the you carry out many of the same tasks time after time.

This can quickly become tiresome and error prone, particularly if you are piping several commands together. However, bash provides several ways to make your life easier.

<h3>Aliases</h3>

If you are always going to be using the same flags with a command, you can ensure that they are called by default by using an alias. 

An alias is a shorthand that bash uses in order to fire commands. Several are included as standard with Ubuntu (and other distros) and are stored in your .bashrc file. You can edit these and add your own as the need occurs. 

An example of this is that I prefer the human readable file sizes when using ls. You can turn these on using the -h flag, but you have to include this every time you run the command. To make things easier I changed the alias for ll (long list) to read as follows

```

alias ll="ls -ahlF"

```

This way I don't need to remember to put the flag in.

As you build up more of these commands, it makes sense to store them in a separate file so you can easily find and edit them. You can place all of you aliases in a file called .bash_aliases and they will be available for use.

<h3>Scripts</h3>

Aliases are fine for quickly calling simple commands, but many times you will need to carry out more complex tasks. In order to do this, you can make a script, and then call that.

By placing everything into a script, you benefit from being able to carry out more complicated functions, and the easy of calling it from a single command. 

An example of this would be if you wanted to compare two branches in git, and see all of the files that had been created or modified, but not the files that had been deleted. You create a file called git_get_changed_files and put the following in

```

#!/bin/bash
local ORIGINAL CHANGED FILES 
ORIGINAL="$1"
CHANGED="$2"

    FILES=$(git diff --name-status $ORIGINAL..$CHANGED public/ | awk '{print $1"@@@@@"$2}')
    for FILE in $FILES
    do
            echo "$FILE" | awk -F "@@@@@" '{ i=""; if ($1 != "D") print $2}'
    done

```

If you place this in your home/bin folder you will then be able to run  git_get_changed_files like a normal command.

<h3>A Global Function Library</h3>

You can expand on this by creating a global library of functions. This works by putting all of the functions into a folder, where each file is a namespace for different functions.

This can be achieved by creating a script that will source of all of the files in a folder, like so:

```

#!/bin/bash
for f in $(ls /path/to/folder/); 
    do source /path/to/folder/$f; 
done

```

Call this script func and place it in your home/bin folder. Then you put a script in the folder referenced in the file and use the following structure.

```

function parse.(){ # auto complete helper, second argument is a grep against the function list     
    if [[ '' == "$@" ]]
    then
        echo "Parse Namespaced Functions List"
        cat $BASH_SOURCE | grep "^function[^(]" | awk '{j=" USAGE:"; for (i=5; i<=NF; i++) j=j" "$i; print $2" "j}'
    else
        echo "Parse Functions Matching: $@"
        cat $BASH_SOURCE | grep "^function[^(]" | awk '{j=" USAGE:"; for (i=5; i<=NF; i++) j=j" "$i; print $2" "j}' | grep $@
    fi
}

function parse.access_log_top_ten_code() { # Show the top ten code from access_log: useage ...code $FILE $CODE
	FILE=$1
	CODE=$2
	echo "Count the top ten $CODE'd pages"

	cat $FILE | awk '{ i=($9=="$CODE" ) ? $7 : ""; print i; }' | sort | uniq -c | sort -n | tail -n 11 | head -n 10
}

```

In this folder a namespace of parse is created. Running 
```

func parse. 

```

Will list all of the function in the file. Running func parse. log will list all of the function that contain log in the function name or description. When the files are listed, the function name will be displayed with the comment along side it.

As the func command sources all of the different files, you are able to makes use of the functions across different namespaces. This means that you can create a file that will format output and then use that in with your git functions. 

I hope that you are able to make use of this idea, and build your own library of functions. Anything that you thing would be useful to add to the library, please mention below.
