---
layout: post
status: publish
published: true
title: Google Checkout, 501 Error with Mod Security + Solution
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 271
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=271
date: 2009-03-26 10:48:57.000000000 +00:00
categories:
- security
tags:
- googlecheckout
- modsecurity
- mod_security
- mod security
- google checkout
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are pulling your hair out trying to figure out why you are seeing a 501 error in your Google Checkout integration console I may well have the answer and solution for you.

This is the error message you will see in the integration console.

```

 	We encountered an error trying to access your server at https://domain.co.uk/googlecheckout/api/ -- the error we got is Sending failed with HTTP response code: 501. Response body was: <HTML> <HEAD> <TITLE>501 Not Implemented</TITLE> </HEAD> <BODY> <H1>Not Implemented</H1> The page you are looking for cannot be displayed because a header value in the request does not match certain configuration settings on the Web server.<P> <HR> <ADDRESS> Web Server at domain.co.uk </ADDRESS> </BODY> </HTML> <!-- - Unfortunately, Microsoft has added a clever new - "feature" to Internet Explorer. If the text of - an error's message is "too small", specifically - less than 512 bytes, Internet Explorer returns - its own error message. You can turn that off, - but it's pretty tricky to find switch called - "smart error messages". That means, of course, - that short error messages are censored by default. - IIS always returns error messages that are long - enough to make Internet Explorer happy. The - workaround is pretty simple: pad the error - message with a big comment like this to push it - over the five hundred and twelve bytes minimum. - Of course, that's exactly what you're reading - right now. --> 

```

The first thing to do is log into your server via SSH and examine the error logs.

find the error logs, open the file up in vi using this command:

```

vi error_log

```

Then go to the bottom of the file using the ```shift
 + [g] shortcut. Then to search backwards in the log use the following command:

[code]
?ModSecurity

```

If you find something with this error message then you have mod security installed. If you search around you may well find an error message like this:

<blockquote>
[Thu Mar 26 10:22:11 2009] [error] [client 94.229.166.12] ModSecurity: Access denied with code 501 (phase 2). Match of "rx (?:^(?:application\\/x-www-form-urlencoded(?:;(?:\\s?charset\\s?=\\s?[\\w\\d\\-]{1,18})?)??$|multipart/form-data;)|text/xml)" against "REQUEST_HEADERS:Content-Type" required. [file "/etc/httpd/modsecurity.d/modsecurity_crs_30_http_policy.conf"] [line "71"] [id "960010"] [msg "Request content type is not allowed by policy"] [severity "WARNING"] [tag "POLICY/ENCODING_NOT_ALLOWED"] [hostname "247electrical.co.uk"] [uri "/googlecheckout/api"] [unique_id "-UMIen8AAAEAAFsDLH4AAAAB"]
</blockquote>

This error message tells us which particular rule is causing it to fail. What we need to do now is either edit this rule or disable it altogether. I will first try to edit it so that the request can get through, but the rule is still active. The rule we need to edit is in this rules file:

modsecurity_crs_30_http_policy.conf

and is on line 71.

I'm no mod security expert. Having had a quick look through the documentation I am not sure how to edit this rule to allow Google Checkout callbacks through. So for the time being I am going to disable this particular rule altogether by adding a  # in front of lines 70,71 and 72.

If any mod security experts out there read this blog and know a better solution please do post it in the comments.
<h4>More...</h4>
			<div style="font-size: .6em;"><a href="http://www.edmondscommerce.co.uk/blog/php/online-ssl-checker-google-checkout/" rel="nofollow">Online SSL Checker (<b>Google Checkout</b>) | Edmonds Commerce Blog</a><br><a href="http://www.prfriend.com/pr/2009/03/24/visionspecialists-introduces-google-checkout-and-a-brand-new-line-of-eyewear/" rel="nofollow">Visionspecialists introduces <b>Google Checkout</b> and a brand new line <b>...</b></a><br><a href="http://blog.formspring.com/2009/03/13/google-checkout-and-nonprofits/" rel="nofollow"><b>Google Checkout</b> and Nonprofits | FormSpring Blog</a><br><a href="http://www.prfriend.com/pr/2009/03/24/visionspecialists-introduces-google-checkout-and-a-brand-new-line-of-eyewear/" rel="nofollow">Visionspecialists introduces <b>Google Checkout</b> and a brand new line <b>...</b></a><br><a href="http://blog.formspring.com/2009/03/13/google-checkout-and-nonprofits/" rel="nofollow"><b>Google Checkout</b> and Nonprofits | FormSpring Blog</a><br><a href="http://novirusthanks.org/blog/2009/03/modsecurity-v259-released-fixed-a-potential-dos-vulnerability/" rel="nofollow">NoVirusThanks Blog » <b>ModSecurity</b> v2.5.9 Released (fixed a <b>...</b></a><br><a href="http://maxgarrick.com/8-modsecurity-tips/" rel="nofollow">maxgarrick.com » 8 <b>ModSecurity</b> Tips for a Successful Roll-out</a><br><a href="http://community.nstalker.com/what-should-we-do-when-web-protection-mechanisms-fail" rel="nofollow">What should we do when web protection mechanisms fail? | N-Stalker <b>...</b></a><br><a href="http://novirusthanks.org/blog/2009/02/modsecurity-257-for-apache-web-server/" rel="nofollow">NoVirusThanks Blog » <b>ModSecurity</b> 2.5.7 for Apache Web Server</a><br><a href="http://novirusthanks.org/blog/2009/03/modsecurity-v259-released-fixed-a-potential-dos-vulnerability/" rel="nofollow">NoVirusThanks Blog » <b>ModSecurity</b> v2.5.9 Released (fixed a <b>...</b></a><br><a href="http://maxgarrick.com/8-modsecurity-tips/" rel="nofollow">maxgarrick.com » 8 <b>ModSecurity</b> Tips for a Successful Roll-out</a><br><a href="http://novirusthanks.org/blog/2009/02/modsecurity-257-for-apache-web-server/" rel="nofollow">NoVirusThanks Blog » <b>ModSecurity</b> 2.5.7 for Apache Web Server</a><br><a href="http://www.microdevsys.com/WordPress/2009/01/14/apache-configuring-mod_security-modsecurity-for-apache-on-fedora/" rel="nofollow">Apache: Configuring <b>mod_security</b> (<b>modsecurity</b>) for Apache on Fedora.</a><br><a href="http://admin.jugamanusia.com/mod_security-what-is-and-how-to/" rel="nofollow">admin.jugamanusia.com » <b>Mod_Security</b>.. what is and how to ?</a><br></div>
