---
layout: post
title: "Behat and emulating mobile browsers using chrome"
date: 2015-02-03 13:00:25 +0000
comments: true
author: michael
categories: 
- Behat
tags: 
- behat
- testing
- bdd
- tdd
- mobile
description: "For some system the ability to test a seporate mobile theme in regards to functionality would be usefull" 
---
Lets admit it not all mobile sites are responsive as they were created when responsive sites were in their infancy or just did not exist. Along with that and even if a site is responsive some elements, images, styles and javascript maybe exclusive to mobile user agents or excluded all together due to file size concerns.

It would be useful to test a site when it is dealing with a mobile user agent. However you don not always need a actual mobile browser thanks to chromes mobile device emulation. Although it is not useful it can at lest be used to do some testing when site responds to specific user agents. Chromes mobile emulation can be driven with behat using the following example:
``` yaml
default: 
  extensions: 
    Behat\MinkExtension: 
      base_url: "http://urltotest.com/"
      default_session: selenium_firefox_session
      goutte: ~
      sessions: 
        goutte_session: 
          goutte: 
            guzzle_parameters: 
              ssl.certificate_authority: false
        selenium_chrome_mobile_session: 
          selenium2: 
            browser: chrome
            capabilities: 
              extra_capabilities: 
                chromeOptions: 
                  mobileEmulation: 
                    deviceName: "Google Nexus 5"
        selenium_chrome_session: 
          selenium2: 
            browser: chrome
            capabilities: 
              extra_capabilities: 
                chromeOptions: 
                  args: 
                    - "--start-maximized"
                    - "--test-type"
        selenium_firefox_session: 
          selenium2: 
            browser: firefox
  suites: 
    my_suite: 
      contexts: 
        - FeatureContext
        - Behat\MinkExtension\Context\MinkContext

chrome_mobile: 
  extensions: 
    Behat\MinkExtension: 
      default_session: selenium_chrome_mobile_session
```

With Behat and Mink we are able to pass extra parameters to the chrome selnium driver using the extra_capabilities options. In the above example we enable mobile emulation using the "Google Nexus 5" profile. To drive tests using this we have two options.

Specify the profile at run time using:
``` bash
bin/behat -p chrome
```

Alternative you can tag specific scenarios to use a given profile by using the following tag above the scenario you want to affect:
``` bash
@mink:selenium_chrome_mobile_session
``` 
