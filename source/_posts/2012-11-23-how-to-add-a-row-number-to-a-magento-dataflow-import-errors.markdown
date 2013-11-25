---
layout: post
status: publish
published: true
title: How To Add a Row Number to A Magento Dataflow Import Errors
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 3694
wordpress_url: http://www.edmondscommerce.co.uk/?p=3694
date: 2012-11-23 19:17:50.000000000 +00:00
categories:
- php
- magento
tags:
- magento
- import
---
I find it frustrating when importing data into Magento that it'll successfully complain about a row with errors, but won't tell you which row has the problem!

The code which generates the HTML for the error messages is at app/code/core/Mage/Adminhtml/Block/System/Convert/Profile/Run.php. Make a copy of this file at app/code/local/Mage/Adminhtml/Block/System/Convert/Profile/Run.php

Locate this part:

```php

                $this->setBatchConfig(
                        ...
                        'template' => '<li style="#{style}" id="#{id}">'
                                    . '<img id="#{id}_img" src="#{image}" class="v-middle" style="margin-right:5px"/>'
                                    . '<span id="#{id}_status" class="text">#{text}</span>'
                                    . '</li>',
                         ...

```

And change:

```php

'<span id="#{id}_status" class="text">#{text}</span>'

```

to:

```php

'<span id="#{id}_status" class="text">Row #{id} - #{text}</span>'

```
