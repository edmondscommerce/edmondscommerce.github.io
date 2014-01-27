---
layout: post
status: publish
published: true
title: Magento Silent Failures and How to Find and Stop Them
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2114
wordpress_url: http://www.edmondscommerce.co.uk/?p=2114
date: 2011-02-03 14:04:09.000000000 +00:00
categories:
- magento
tags:
- magento
- silent
- failure
- is_readable
---
If you are finding that Magento seems to be silently failing to include your files without triggering any kind of error (this tends to happen mostly with layouts or installer scripts) then you might find this useful.

For me, my installer script wasn't working and it turned out to be a tiny typo in my config.xml file that meant that Magento was looking in the wrong place for the file and failing silently when it didn't find it:

The code in question is here:

<strong>Mage_Core_Model_Resource_Setup
</strong>
```php

protected function _modifyResourceDb($actionType, $fromVersion, $toVersion)
    {
        $resModel = (string)$this->_connectionConfig->model;
        $modName = (string)$this->_moduleConfig[0]->getName();

        $sqlFilesDir = Mage::getModuleDir('sql', $modName).DS.$this->_resourceName;
        if (!is_dir($sqlFilesDir) || !is_readable($sqlFilesDir)) {
            die($sqlFilesDir); //it was failing silently here, not really helpful to me
            return false;
        }

```

There are a few of these kinds of code snippets around the codebase. I started to think how much easier a developers life would be if we could make Magento throw exceptions instead of silently failing, at least if we are in developer mode anyway.

To track them down we can use a bit of grep and xargs

```

find $ABSOLUTE_PATH_TO_MAGENTO_ROOT  -name "*.php" | xargs  grep -n -B 6 -A 3 "!is_readable("  > $ABSOLUTE_PATH_TO_OUTPUT_FILE_INC_FILE_NAME

```

At some point I intend to figure a way of tracking down all these silent failures and making them noisy!
