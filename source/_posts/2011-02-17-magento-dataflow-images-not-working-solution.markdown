---
layout: post
status: publish
published: true
title: Magento Dataflow Images Not Working + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2144
wordpress_url: http://www.edmondscommerce.co.uk/?p=2144
date: 2011-02-17 16:03:49.000000000 +00:00
categories:
- magento
tags:
- magento
- exception
- error
- images
- solution
- dataflow
- slash
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are struggling to understand why Magento is not finding images that are definitely there, the problem may well be that you are not prefixing your image with a slash, i.e for a new image we would put:

/image.jpg

and the image would be in 

media/import/image.jpg

Unfortunately whoever wrote the Dataflow product importer though it would be a good idea to silently capture all exceptions on image imports which removes any useful error messages that might occur (such as no image at media/importimage.jpg)

If you would prefer to fix this, you can override Mage_Catalog_Model_Convert_Adapter_Product 

Copy the saveRow() method into your overriding class and then change this bit

```php

foreach ($imageData as $file => $fields) {
            try {
                $filepath = Mage::getBaseDir('media') . DS . 'import' . trim($file);
                $product->addImageToMediaGallery($filepath, $fields);
            } catch (Exception $e) {}
        }


```

To something like this

```php

foreach ($imageData as $file => $fields) {
            //try {
                $filepath = Mage::getBaseDir('media') . DS . 'import' . trim($file);
                $product->addImageToMediaGallery($filepath, $fields);
           //} catch (Exception $e) {}
        }

```

