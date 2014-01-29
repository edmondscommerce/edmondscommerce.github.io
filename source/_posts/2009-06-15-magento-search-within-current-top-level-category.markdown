---
layout: post
status: publish
published: true
title: Magento Search Within Current Top Level Category
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 801
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=801
date: 2009-06-15 14:25:11.000000000 +01:00
categories:
- magento
tags:
- edmondscommerce
---
If you fancy having a select box allowing people to search within a top level category on your site directly from the quick search box, check out this little modification. This gives your search a bit of an Amazon feel. This idea could easily be extended if required.

You can drop this file in as a straight replacement to app/design/frontend/###/###/template/catalogsearch/form.mini.phtml

```php

<?php
/**
 * Magento
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE_AFL.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@magentocommerce.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade Magento to newer
 * versions in the future. If you wish to customize Magento for your
 * needs please refer to http://www.magentocommerce.com for more information.
 *
 * @category   design_default
 * @package    Mage
 * @copyright  Copyright (c) 2008 Irubin Consulting Inc. DBA Varien (http://www.varien.com)
 * @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *
 *
 * @version Edmonds Commerce Quick Search with Top Level Categories
 *
 */

$category = Mage::getModel('catalog/category');
if(is_object(Mage::registry('current_category'))){
    $current_category_path=Mage::registry('current_category')->getPathIds();
}else{
    $current_category_path = array();
}
$category->load(Mage::app()->getStore()->getRootCategoryId());
$children_string = $category->getChildren();
$children = explode(',',$children_string);
$extra_options='';
foreach($children as $c){
    $selected = (in_array($c, $current_category_path))?'SELECTED':'';
    $extra_options.= '<option value="' . $c . '" ' . $selected . '>' . $category->load($c)->getName() . '</option>' . "\n";
}
?>
<form id="search_mini_form" action="<?php echo $this->helper('catalogSearch')->getResultUrl() ?>" method="get">
    <fieldset>
        <legend><?php echo $this->__('Search Site') ?></legend>
        <div class="mini-search">
            <input id="search" type="text" class="input-text" name="<?php echo $this->helper('catalogSearch')->getQueryParamName() ?>" value="<?php echo $this->helper('catalogSearch')->getEscapedQueryText() ?>" />
            <select name="cat" id="cat" class="input-text">
            <option value="">All Departments</option>
            <?= $extra_options ?>
           </select>
            <input type="submit" value="Go" style="border: 1px solid #808080;" alt="<?php echo $this->__('Search') ?>" />
            <div id="search_autocomplete" class="search-autocomplete"></div>
            <script type="text/javascript">
            //<![CDATA[
                var searchForm = new Varien.searchForm('search_mini_form', 'search', '<?php echo $this->__('search site...') ?>');
                searchForm.initAutocomplete('<?php echo $this->helper('catalogSearch')->getSuggestUrl() ?>', 'search_autocomplete');
            //]]>
            </script>
        </div>
    </fieldset>
</form>


```
