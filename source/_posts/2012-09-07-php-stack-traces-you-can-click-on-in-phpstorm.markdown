---
layout: post
status: publish
published: true
title: PHP Stack traces you can click on! (in PhpStorm)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3399
wordpress_url: http://www.edmondscommerce.co.uk/?p=3399
date: 2012-09-07 14:35:37.000000000 +01:00
categories:
- php
tags:
- development
- php
- developer
- debug
- debugging
- tip
- kint
---
Having a stack trace is very handy at times but wouldn't it be nice if you could click on the filename in the stack trace in your browser and your IDE take you to the file and line that it's talking about?

Well, with PhpStorm and kint, you can!  Using a plugin called Remote Call, the PhpStorm IDE can listen on a port and go to files and line numbers via an ajax call.

To configure this, grab the latest version of kint, and copy it's sample config to an actual config file, and edit the section about pathDisplayCallback to look like this :-
```php

$_kintSettings['pathDisplayCallback'] = "_kintLine";
function _kintLine( $file, $line = NULL ) {
        if ( !$line ) { // means this is called from resource type dump
                return $file;
        }
        return "<u><a class=\"kint-ide-link\" href=\"http://localhost:8091/?message={$file}:{$line}\">" . $file . "</a></u> line <i>{$line}</i>";
}

```

You can even be clever with regex to make the filenames be relative - for instance, we run our projects from a directory below one called, oddly enough "projects" and our function looks like this :-
```php

function _kintLine( $file, $line = NULL )
{
        $shortname = preg_replace('#.*/[Pp]rojects/[^/]*/#','',$file);
        if ( !$line ) { // means this is called from resource type dump
                return $shortname;
        }
        return "<u><a class=\"kint-ide-link\" href=\"http://localhost:8091/?message={$file}:{$line}\">" . $shortname . "</a></u> line <i>{$line}</i>";
}

```

Now, if you call Kint::trace(); from your file that you've included Kint.class.php from, you get a clickable stacktrace!
