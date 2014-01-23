---
layout: post
status: publish
published: true
title: 'Solution: Magento Catalog URL Rewrites Never Finishes (processing)'
author: martyn
author_login: martyn
author_email: info+martyn@edmondscommerce.co.uk
wordpress_id: 3732
wordpress_url: http://www.edmondscommerce.co.uk/?p=3732
date: 2012-12-05 17:27:51.000000000 +00:00
categories:
- magento
tags:
- development
- problem
- magento
- solution
---
In <a title="Magento" href="http://www.edmondscommerce.co.uk/platforms/Magento">Magento</a> 1.4.2 and possibly other versions, you can often find that the Catalog URL Rewrite process will sit at Processing forever.

One of the problems that can cause this is if you have products in multiple categories and the solution is not pretty, but it works.

Copy the file /app/code/core/Mage/Catalog/Model/Url.php to /app/code/local/Mage/Catalog/Model/Url.php (You never edit core files right?!) and around line 770 there is the following code block :-

```php

        // generate id_path
        if ('id' === $type) {
            if (!$product) {
                return 'category/' . $category->getId();
            }
            if ($category && $category->getLevel() > 1) {
                return 'product/' . $product->getId() . '/' . $category->getId();
            }
            return 'product/' . $product->getId();
        }

```
Changing this to the following seems to fix the problem :-
```php

        // generate id_path
        if ('id' === $type) {
            if (!$product) {
                return 'category/' . $category->getId();
            }
            if ($category && (count(explode('/', $category->getPath())) - 1) > 1) {
                return 'product/' . $product->getId() . '/' . $category->getId();
            }
            return 'product/' . $product->getId();
        }

```
