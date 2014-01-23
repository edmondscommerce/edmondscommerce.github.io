---
layout: post
status: publish
published: true
title: Magento Shell Scripts and Memory Limit Woes + Solution
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3807
wordpress_url: http://www.edmondscommerce.co.uk/?p=3807
date: 2012-12-19 11:53:48.000000000 +00:00
categories:
- magento
tags:
- magento
- solution
- shell
- class
- abstract
- memory
- limit
---
OK so you love Magento's shell scripts! They are great for quickly putting together bulk processes that have full access to the Magento ORM.

These kinds of shell scripts will often require above normal amounts of RAM for the kind of heavy lifting they lend themselves well to. If you are finding your script is banging against some mysterious memory limit that really shouldn't be there then perhaps this is your answer:

You might see an error message such as this:

```

Fatal error:  Allowed memory size of 134217728 bytes exhausted (tried to allocate 20 bytes)

```

The reason this might be happening is that one of the things the abstract shell class does is parse the .htaccess file and apply any PHP configuration it finds. This is pretty slick and I can definitely see the value of it however if you are not aware its happening and you have a memory limit defined in a .htaccess file then it will be applied to your shell environment.

The solution is up to you, edit the htaccess file or override this method in your shell class so that it doesn't do things you do not want:

```php

    /**
     * Parse .htaccess file and apply php settings to shell script
     *
     */
    protected function _applyPhpVariables()
    {
        $htaccess = $this->_getRootPath() . '.htaccess';
        if (file_exists($htaccess)) {
            // parse htaccess file
            $data = file_get_contents($htaccess);
            $matches = array();
            preg_match_all('#^\s+?php_value\s+([a-z_]+)\s+(.+)$#siUm', $data, $matches, PREG_SET_ORDER);
            if ($matches) {
                foreach ($matches as $match) {
                    @ini_set($match[1], $match[2]);
                }
            }
            preg_match_all('#^\s+?php_flag\s+([a-z_]+)\s+(.+)$#siUm', $data, $matches, PREG_SET_ORDER);
            if ($matches) {
                foreach ($matches as $match) {
                    @ini_set($match[1], $match[2]);
                }
            }
        }
    }

```
