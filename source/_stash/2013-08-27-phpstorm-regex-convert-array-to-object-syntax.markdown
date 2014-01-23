---
layout: post
status: publish
published: true
title: PHPStorm Regex Convert Array to Object Syntax
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4481
wordpress_url: http://www.edmondscommerce.co.uk/?p=4481
date: 2013-08-27 14:40:35.000000000 +01:00
categories:
- php
tags:
- find
- replace
- php
- array
- object
- syntax
- regex
- phpstorm
---
If you are converting some code from using array syntax to object property syntax then you might like this little snippet of regex.

This is design to paste straight into the find/replace dialogue in PHPStorm

Find:
```

\$(\w+)\['([^']+)'\]

```

Replace:
```

\\\$$1->$2

```

And that is it
