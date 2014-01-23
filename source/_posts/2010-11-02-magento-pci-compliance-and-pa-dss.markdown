---
layout: post
status: publish
published: true
title: Magento PCI Compliance and PA-DSS
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1877
wordpress_url: http://www.edmondscommerce.co.uk/?p=1877
date: 2010-11-02 11:09:48.000000000 +00:00
categories:
- magento
tags:
- magento
- pci
- pa-dss
- compliance
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
I recently came across a forum post which I would like to quote here as I think it sums things up nicely. You can see the original post <a href="http://www.nublue.co.uk/forums/post/622/#p622">here</a>.

The Community edition has not been verified as PA-DSS compliant, which is not the same as PCI-DSS compliancy.

PCI-DSS is the compliancy of your online environment, practices, software etc.  That is the standard that is required to be able to process on-site payments.
PA-DSS is not the same, it is part of PCI-DSS.  It's a standard for the software that you are using for processing payments, just as PCI-DSS is the standard for the merchants processing payments on-site.  PA-DSS is the standard whereby the software provider subjects the software to a rigorous set of standards, tests and development practices (all viewable on the PA DSS Website) to confirm that the PA-DSS requirements are entirely met.
Anyone using Community edition has 2 options:

1 - use an off-site payment gateway, so none of this matters (the gateway will be PA-DSS software running in a PCI-DSS environment and PCI-DSS is not therefore required) - this is by far the easiest option available!

2 - verify the software as PA-DSS compliant yourself by going through the PCI-DSS questionnaire and confirming the relevant data.
There is nowhere in the PCI-DSS questionnaire that says, "if your payment software has not been certified as PA-DSS compliant, you cannot be PCI-DSS compliant". 

However the basic tenets of PA-DSS compliancy is an essential part of becoming PCI-DSS compliant.
The only thing that PA-DSS provides, is a guarantee that any part of the compliancy questionnaire related to PA-DSS requirements (encryption of card #'s, cardholder data etc) is a certified yes, that does not require any investigation and confirmation from the client first.  These areas are all listed within the PCI-DSS SAQ (Self Assessment Questionnaire).  There is also a lengthy PA-DSS document on the website that lists the requirements of PA-DSS - the community edition, presumably, doesn't meet these requirements, as it is a hook for paying for the Professional or Enterprise editions, as they have in turn paid and worked on having those editions verified, but don't see the benefits to implementing this for the Community edition.

Whereas the Pro/Enterprise editions will include certain best-practice features (such as auto-expiring passwords for instance) and of course are PA-DSS compliant, it's also worth mentioning while we're on the subject that they do not anywhere explicitly state that the Community edition is not PA-DSS compliant...

It really means the PCI-DSS responsibility is further placed on the clients' shoulders; PA-DSS means you have one less thing to worry about.
