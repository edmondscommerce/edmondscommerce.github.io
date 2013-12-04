---
layout: post
status: publish
published: true
title: Magento Controller Action Return Json (for AJAX, API etc)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2939
wordpress_url: http://www.edmondscommerce.co.uk/?p=2939
date: 2012-02-15 14:15:01.000000000 +00:00
categories:
- magento
tags:
- magento
- custom
- module
- ajax
- model
- block
- layout
- api
- header
- controller
- json
- response
- query
- param
---
If you have a controller action that is designed to be accessed by AJAX requests or perhaps as part of a custom API system then you might like this snippet.

If you are working with the above scenario you likely would like to return pure JSON without any HTML etc. Also serving up the correct content type headers is going to be helpful, its not HTML, its JSON.

```php

    public function searchAction(){
        $query = $this->getRequest()->getParam('query');
        $json = Mage::getModel('mymodule/mymodel')->getSearchJson($query);
        $this->getResponse()->setHeader('Content-type', 'application/json');
        $this->getResponse()->setBody($json);
    }

```
