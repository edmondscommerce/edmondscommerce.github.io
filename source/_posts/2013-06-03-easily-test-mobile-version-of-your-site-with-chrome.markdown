---
layout: post
status: publish
published: true
title: Easily Test Mobile Version of your Site with Chrome
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4320
wordpress_url: http://www.edmondscommerce.co.uk/?p=4320
date: 2013-06-03 15:33:27.000000000 +01:00
categories:
- Mobile optimisation
tags:
- magento
- theme
- chrome
- android
- mobile
- chromium
- preview
- developer tools
- overrides
- iphone
---
If you have opted to have a customised mobile theme displayed for mobile users of your web site then it can be useful to be able to test this theme from the desktop. This is quite simple to do and there are plugins for most browsers. These days though Chrome users have this functionality built in, and quite nicely as well.

To access a mobile version of a site simply open Chrome and navigate to the site you would like to view in mobile version.

Then hit F12 to bring up the developer tools. Alternatively you can go to the right hand menu and select developer tools under the tools menu. This should bring up a screen looking similar to this:

{% img  /assets/Screenshot-from-2013-06-03-162921-600x475.png %}

In the bottom right hand corner of this screen you will see a little cog icon, please click that:

{% img  /assets/Screenshot-from-2013-06-03-162956.png %}

This gives you the overrides menu where you can select the phone you want to emulate. You can also tick the device metrics box so that the displayable area corresponds to that of the phone giving you a good emultation of the phone experience.{% img  /assets/Screenshot-from-2013-06-03-163013-600x354.png %}

Tick the box next to User Agent and choose a phone.

Once you have selected the phone you want to emulate under the "user agent" section and also optionally ticked the box next to "Device metrics" then you can reload the page (hit [ctrl] + [f5]) and the page will be reloaded and should show you the mobile version of your site.
