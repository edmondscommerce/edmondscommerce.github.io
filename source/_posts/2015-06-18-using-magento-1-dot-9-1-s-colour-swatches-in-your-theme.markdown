---
layout: post
title: "Using Magento 1.9.1's Colour Swatches in your custom theme"
date: 2015-06-18 18:56:49 +0100
comments: true
author: kenneth
categories: 
 - magento
tags: 
 - magento
 - theme
description: A breakown of what you need to do to use Magento's new colour swatches in your custom theme
---

If you've upgraded to Magento 1.9.1 you might have noticed new functionality in the Admin to add colour swatches to your attributes. These work well but for reasons only known to Magento, these require you to be using the new rwd theme, or a derivitive of it. There's no reference to it in base/default so if your theme isn't a derivitive of rwd you'll need to copy the code across.

If you look in the rwd/default theme, you'll notice there are folders for configurableswatches in layout, template and skin. These are the ones you'll need to copy across. But there's also a bit of customisation needed.

###Step 1: Copy over the colourswatches files and folders

Copy these files from the rwd theme to the same places in your custom theme

- `app/design/frontend/rwd/default/`**`layout/configurableswatches.xml`**
- `app/design/frontend/rwd/default/`**`template/configurableswatches/`**
- `skin/frontend/rwd/default/`**`js/configurableswatches/`**

###Step 2: Update your theme's layout

The layout file `configurableswatches.xml` expects certain blocks to be present, which are only set in rwd's `catalog.xml`

Add the following lines to your theme's `catalog.xml`:

```
    <PRODUCT_TYPE_configurable>
        ...
         <reference name="product.info.options.wrapper">
             <block type="catalog/product_view_type_configurable" name="product.info.options.configurable" as="options_configurable" before="-" template="catalog/product/view/type/options/configurable.phtml">
    +             <block type="core/text_list" name="product.info.options.configurable.renderers" as="attr_renderers" />
    +             <block type="core/text_list" name="product.info.options.configurable.after" as="after" />
             </block>
         </reference>
     </PRODUCT_TYPE_configurable>
```

###Step 3: Add your images

There's two ways you can set the swatch images:

- Globally at `media/wysiwyg/swatches`
- On the attribute at > Catalog > Attributes > Manage Attributes > [your attribute] > Manage Label/Options (don't forget to save the attribute after it's uploaded)

###Step 4: Enable the swatches

You'll need to enable the use of swatches at System Configuration > Catalog > Configurable Swatches.

In General Settings, set Enabled to Yes and select your attribures in "Product Attributes to Show as Swatches in Product Detail"

###Step 5: Apply CSS

As with everything else the style information is only in rwd's stylesheets. You'll likely need to make some small modifications to make them look acceptable. As a baseline this should suffice:

    .product-options .swatch-attr .configurable-swatch-list li {
        display: inline-block;
        border:1px solid #CACACA;
        padding: 1px;
    }
    .product-options .swatch-attr .configurable-swatch-list li.selected {
        border-color:#0095D3;
    }

