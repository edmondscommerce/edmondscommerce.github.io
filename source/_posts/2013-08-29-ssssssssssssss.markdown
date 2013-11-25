---
layout: post
status: publish
published: true
title: Add a Backorder Message on Magento's Product Page
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 4490
wordpress_url: http://www.edmondscommerce.co.uk/?p=4490
date: 2013-08-29 15:37:37.000000000 +01:00
categories:
- magento
tags:
- edmondscommerce
---
Magento's use of backorders does notify the customer, but only once you actually reach the basket page, which can lead to disappointment and frustration from the customer. The better answer is to display this on the product page, in place of the "In Stock" message.

To acheive this, we just need to amend (read: override) the templates at

app/design/frontend/base/default/template/catalog/product/view/type/simple.phtml
app/design/frontend/base/default/template/catalog/product/view/type/grouped.phtml
app/design/frontend/base/default/template/catalog/product/view/type/configurable.phtml

And amend it to look like this:

```php


<?php $_product = $this->getProduct() ?>
<?php echo $this->getPriceHtml($_product) ?>
<?php $stockLevel = (int)Mage::getModel('cataloginventory/stock_item')->loadByProduct($_product)->getQty(); ?>

<?php if($_product->isSaleable()<strong> && $stockLevel > 0</strong>): ?>
    <p class="availability in-stock"><?php echo $this->__('Availability:') ?> <span><?php echo $this->__('In stock') ?></span></p>
<?php elseif($_product->isSaleable() && $stockLevel <= 0): ?>
    <p class="availability in-stock">
        <?php echo $this->__('Availability:') ?> <span><?php echo $this->__('Available for Backorder') ?></span><br />
        <?php echo $this->__('Please allow up to two weeks for delivery') ?>
    </p>
<?php else: ?>
    <p class="availability out-of-stock"><?php echo $this->__('Availability:') ?> <span><?php echo $this->__('Out of stock') ?></span></p>
<?php endif; ?>



```
