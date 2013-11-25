---
layout: post
status: publish
published: true
title: NetBeans PHP Comments
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2620
wordpress_url: http://www.edmondscommerce.co.uk/?p=2620
date: 2011-09-08 10:35:22.000000000 +01:00
categories:
- netbeans
tags:
- php
- netbeans
- autocomplete
- ide
- comments
- coading
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Comments your code are essential to help both other developers and, in some cases, yourself understand what the code is meant to be doing.

When developing PHP in NetBeans there are two types of comments to consider. The first type of comments are the normal type of comments that are for a human to read and understand. This type of comments will say thing like "// This section is here to..." and "// This is necessary because...". While human readable are definitely good, one of the issues when developing PHP is that it is difficult for IDEs to maintain the type of variables, the return types of methods and the type of variables that a method excepts. This is mainly because PHP is loosely typed but also because IDEs often can't follow the inheritance hierarchy for what ever reason.

To get around the issues of type hierarchy and PHP been a loosely typed language, NetBeans supports type definition comments. This type of comment is intended to help the user of the IDE know what type a variable should be and also what types of variables a method expects and allow auto completion to function.

Example:
<code>
    /**
     * Remove item from cart
     *
     * @param   int $itemId This is the id of the item to remove
     * @return  Mage_Checkout_Model_Cart
     */
    public function removeItem($itemId)
    {
        $this->getQuote()->removeItem($itemId);
        return $this;
    }
</code>
This example lets NetBeans know that removeItem's one parameter should be an integer and that it returns an object of type Mage_Checkout_Model_Cart.
<a href="{% img  ({{ site.url }}/assets/autocompleate1.png %}"><img src="{% img  ({{ site.url }}/assets/autocompleate1.png %}" alt="" title="Type Autocompleation" width="556" height="362" class="alignleft size-full wp-image-2621" /></a>

The other type of type comment tells NetBeans that a particular variable is of a specific type.
For example:
<code>
class RemeberNumber {

    /** @var $theNumber int */
    protected $theNumber;

    public function __construct($number) {
        $this->theNumber = $number;
    }
}
</code>

Because of the /** @var $theNumber int */ auto completion will now use that as the type else where with in the scope of that variable definition.

<a href="{% img  ({{ site.url }}/assets/autocompleate2.png %}"><img src="{% img  ({{ site.url }}/assets/autocompleate2.png %}" alt="" title="Auto Compleation Example" width="555" height="378" class="alignleft size-full wp-image-2622" /></a>
