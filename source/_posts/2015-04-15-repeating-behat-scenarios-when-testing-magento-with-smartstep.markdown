---
layout: post
title: "Repeating Behat Scenarios when Testing Magento with SmartStep"
date: 2015-04-15 12:02:28 +0100
comments: true
author: kenneth
categories: 
- behat
tags: 
 - magento
 - behat
 - testing
 - smartstep
description:  Avoid reusing Gherkin code when running behat tests against Magento
---

When behat testing Magento I found myself repeating the same Homepage > Category > Product > Add-to-cart > Cart page scenario for a variety of tests - checking that a category page has products; checking that items are added to the cart; testing the checkout itself etc etc.

I didn't want to copy-paste the whole procedure because if I changed, say the `.product-list` class, I'd have to update each of the Scenarios. Bit of a kick in the face to [DRY](http://en.wikipedia.org/wiki/Don%27t_repeat_yourself).

The standard Behat way is to create a method in the Context class which performs the add-to-cart procedure under the Step `Given I have added to cart` or similar, but this defeats the object of using Gherkin to write the tests.

Fortunately KnpLabs have soled this problem with [SmartSteps](https://github.com/KnpLabs/FriendlyContexts/blob/master/doc/feature-smartStep.md). This allows you to create a Scanerio that you want to be repeatable by tagging it as a `@smartStep`. Once it's tagged, you can easily embed that scenario into a new one by having a step `Given [scenario name]`

###Adding SmartSteps to your behat tests

- In `composer.json`, add a new dependency
```
"knplabs/friendly-contexts": "dev-master"
```
- In `behat.yml`
```
default:
    extensions:
        Knp\FriendlyContexts\Extension:
            smartTag: smartStep

```
- Tag your scenario

```
  @smartStep
  Scenario: I arrive on the site and add a product to cart
    When I am on "/"
    Then I follow "My category"
    Then I follow "My product"
    Then I press "Add to Cart"
    And I should see "was added to your shopping cart"
```
- And then use the Scenario in any other scenarios with
```
Given I arrive on the site and add a product to cart
```
