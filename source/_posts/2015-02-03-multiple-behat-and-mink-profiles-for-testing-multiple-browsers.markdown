---
layout: post
title: "Multiple Behat and Mink profiles for testing multiple browsers"
date: 2015-02-03 12:20:36 +0000
comments: true
author: michael
categories: 
- Behat
tags: 
- behat
- testing
- bdd
- tdd
description: "Behat is great for BDD testing but what if you want to test javascript driven functionality in multiple browsers."
---
Behat makes it easy to write and run automated testing in browser and in most cases where functionality is not javascript driven then testing in a single browser is fine.

However if you are testing Javascript driven functionality then it is best to have multiple profiles for multiple browsers without having to write the scenario multiple times with different tagsi for different sessions. Luckily behat support defination of multiple profiles which inherit from a single default profile for all your browser needs. You simply need to set up your bhat yaml config file like so:
``` yaml
default: 
  extensions: 
    Behat\MinkExtension: 
      base_url: "http://someurl.com"
      default_session: selenium_firefox_session
      goutte: ~
      sessions: 
        goutte_session: 
          goutte: 
            guzzle_parameters: 
              ssl.certificate_authority: false
        selenium_chrome_session: 
          selenium2: 
            browser: chrome
        selenium_firefox_session: 
          selenium2: 
            browser: firefox
  suites: 
    my_suite: 
      contexts: 
        - FeatureContext
        - Behat\MinkExtension\Context\MinkContext

chrome: 
  extensions: 
    Behat\MinkExtension: 
      default_session: selenium_chrome_session

firefox: 
  extensions: 
    Behat\MinkExtension: 
      default_session: selenium_firefox_session
```

The to run the crome profile for example use the -p option flag on the behat command as show:
``` bash
bin/behat -p chrome
```
