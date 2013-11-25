---
layout: post
status: publish
published: true
title: SagePay Test Card Details
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1873
wordpress_url: http://www.edmondscommerce.co.uk/?p=1873
date: 2010-11-01 12:10:22.000000000 +00:00
categories:
- ecommerce
tags:
- test
- sagepay
- card
- details
- integration
- credit
- debit
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are testing out your SagePay integration, you need to be able to input some test card details that the test.sagepay.com system will accept.

Here they are:

or testing transactions on the Protx test server, use the following card numbers. 

NB: there are NO dummy cards to use on the Live server. Actual Live bank cards must be used. 

<table class="ProtocolTables" cellspacing="0" cellpadding="0" border="1"><tbody><tr><td class="protxNames" align="middle" height="27">Card Type</td><td class="protxNames" align="middle" height="27">Protx Card Name</td><td class="protxNames" align="middle" height="27">Card Number</td><td class="protxNames" align="middle" height="27">Issue Number</td></tr><tr><td align="middle" height="27">Visa</td><td align="middle" height="27">VISA</td><td align="middle" height="27">4929000000006</td><td align="middle" height="27">n/a</td></tr><tr><td align="middle" height="27">Visa Delta</td><td align="middle" height="27">DELTA</td><td align="middle" height="27">4462000000000003</td><td align="middle" height="27">n/a</td></tr><tr><td align="middle" height="27">Visa Electron UK Debit</td><td align="middle" height="27">UKE</td><td align="middle" height="27">4917300000000008</td><td align="middle" height="27">n/a</td></tr><tr><td align="middle" height="27">Mastercard</td><td align="middle" height="27">MC</td><td align="middle" height="27">5404000000000001</td><td align="middle" height="27">n/a</td></tr><tr><td align="middle" height="27">UK Maestro</td><td align="middle" height="27">MAESTRO</td><td align="middle" height="27">5641820000000005</td><td align="middle" height="27">01</td></tr><tr><td align="middle" height="27">International Maestro</td><td align="middle" height="27">MAESTRO</td><td align="middle" height="27">300000000000000004</td><td align="middle" height="27">n/a</td></tr><tr><td align="middle" height="27">Solo</td><td align="middle" height="27">SOLO</td><td align="middle" height="27">6334900000000005</td><td align="middle" height="27">1</td></tr><tr><td align="middle" height="27">American Express</td><td align="middle" height="27">AMEX</td><td align="middle" height="27">374200000000004</td><td align="middle" height="27">n/a</td></tr><tr><td align="middle" height="27">Japan Credit Bureau (JCB)</td><td align="middle" height="27">JCB</td><td align="middle" height="27">3569990000000009</td><td align="middle" height="27">n/a</td></tr><tr><td align="middle" height="27">Diners Club</td><td align="middle" height="27">DC</td><td align="middle" height="27">36000000000008</td><td align="middle" height="27">n/a</td></tr></tbody></table>

You'll also need to supply an Expiry Date in the future and the following values for CV2, Billing Address Numbers and Billing Post Code Numbers. These are the only values which will return as Matched. Any other values will return a Not Matched. 

CV2: 123
Billing Address: 88
Billing PostCode: 412
