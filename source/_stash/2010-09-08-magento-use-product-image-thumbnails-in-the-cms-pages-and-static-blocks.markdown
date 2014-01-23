---
layout: post
status: publish
published: true
title: Magento Use Product Image Thumbnails in the CMS Pages and Static Blocks
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1816
wordpress_url: http://www.edmondscommerce.co.uk/?p=1816
date: 2010-09-08 16:33:15.000000000 +01:00
categories:
- magento
tags:
- magento design cms images
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Pretty standard requirement - using product images in CMS sections, however you may find yourself including static HTML references to product images - and if you are using resized images then you might hardcode in links to cached images, which is obviously going to break at some point, or you painstakingly download copies of product images and reupload them for use in the CMS - but then they might go out of date.

This is the real solution:

1. Create a new template file in {template}/catalog/product/cms_image.phtml

2. Put these contents

```php

<?php
$productId = $this->getProduct_id();
$_product = Mage::getModel('catalog/product')->load($productId);
$imageSize = $this->getImage_size();
?>
<img src="<?php echo Mage::helper('catalog/image')->init($_product, 'thumbnail')->resize($imageSize, $imageSize); ?>"
     alt="<?php echo $this->htmlEscape($_product['name']); ?>" border="0" width="<?php echo $imageSize;?>" />

```

3. Use this snippet in your CMS content (changing product_id and image_size accordingly)
```

{{block type="catalog/product_view" product_id="1752" image_size="135" template="catalog/product/cms_image.phtml"}}

```
