---
layout: post
status: publish
published: true
title: 'Vim Save File You Didn''t Sudo Edit - '
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2170
wordpress_url: http://www.edmondscommerce.co.uk/?p=2170
date: 2011-03-08 05:59:03.000000000 +00:00
categories:
- linux
tags:
- sudo
- permissions
- save
- vim
- readonly
- write
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
How many times have you edited a file in Vim, made your changes and then realised you don't have write permissions when it comes to save it.

Well if you do it again, this tip is for you. You CAN save the file using this command:

```
:w !sudo tee %
```

Lifesaver!

This one direct from one of my personal favourite sites, <a href="http://www.commandlinefu.com/commands/view/1204/save-a-file-you-edited-in-vim-without-the-needed-permissions">Command Line Fu</a>

