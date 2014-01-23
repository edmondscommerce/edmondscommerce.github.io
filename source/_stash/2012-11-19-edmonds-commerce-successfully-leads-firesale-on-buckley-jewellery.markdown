---
layout: post
status: publish
published: true
title: Edmonds Commerce successfully implements marketing firesale on Buckley Jewellery
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 3672
wordpress_url: http://www.edmondscommerce.co.uk/?p=3672
date: 2012-11-19 12:41:07.000000000 +00:00
categories:
- magento
tags:
- marketing
---
<h2>The idea</h2>
<a href="http://www.buckleylondon.com/">Buckley Jewellery</a> approached us with an idea they had for setting up a promotion to go viral. Their idea was to pick one of their products which they were already selling and literally give it away.

<h2>The problems</h2>
The initial requirement was fairly straightforward - we'd set up a Shopping Cart Price Rule with a coupon code to give a 100% discount on the product price if the specific SKU was in the basket. But it then became apparent that there were various problems here.

<strong>Free Shipping Calculations:<strong> Although we'd set it up so that only one of the items were discounted, all items were still factored in when Magento attempted to calculate the shipping costs, so their Free UK Delivery Over &pound;30 policy took effect when two of the item were present

<strong>Different shipping for the free product:<strong> Buckley have shipping rates tailored to a more bulky package, but obviously these free earrings were quite small, and charging upwards of &pound;10 for EU shipping wasn't going to work. We had to find a way to keep their &pound;3.50, &pound;12.50 and &pound;19 shipping for their products, but for the free earrings have an exception - &pound;2.99, &pound;3.99 and &pound;4.99.

<h2>The solutions</h2>
We spent much time with Buckley discussing how to get their requirements to work and went down a few threads of thought

The core discount is a Shopping Cart Price Rule setting a 100% price discount applied only to one of the specific SKU, one per customer, with a coupon code.

To solve the different shipping for different products we decided to leverage products' weights to vary the shipping. Having to work around their MatrixRates extension's limitation to only vary by weight OR basket total vs destination we implemented a standard weight across the board, and changed only the free earrings to be less 'heavy'. We then implemented shipping rules such that if the basket came to a weight less than 1kg (which could only mean it was just the free earrings) the lower shipping rates are applied, otherwise the greater costs

We then reimplemented the free shipping over &pound;30 (at the last minute!) as another Shopping Cart Price Rule so that we could still maintain the free shipping, without having to pay to upgrade their MatrixRates extension

<h2>On the day</h2>
The promotion did go viral - it ended up on various social media, as well as being featured on MoneySavingExpert, with them promising to send it out on their monthly newsletter

The earrings sold out in less than two hours, with people flocking to the site to get their hands on them. Of course, many customers also purchased other items while on the site and they've increased their customer base, while also getting their name out there.

They're now looking to switch over their hosting so that they can stand up to bigger and better promotions in the future
