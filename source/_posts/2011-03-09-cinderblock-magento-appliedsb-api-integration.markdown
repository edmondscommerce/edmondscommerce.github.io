---
layout: post
status: publish
published: true
title: 'Cinder Block Magento AppliedSB API Integration '
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
excerpt: A custom API integration for a large official merchandise retailer in the
  USA. The API handles the streaming samples and purchase of downloadable MP3 tracks
  for a huge range of artists.
wordpress_id: 2189
wordpress_url: http://www.edmondscommerce.co.uk/?p=2189
date: 2011-03-09 10:15:01.000000000 +00:00
categories:
- portfolio
tags:
- magento
- portfolio
- enterprise
- cinderblock
- appliedsb
- api
- extension
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
<a href="http://cinderblock.com/">Cinder Block</a> are a USA based company who retail merchandise for a wide catalog bands and artists in the music industry.

The site is based upon a very large Magento Enterprise based multistore system with unique official store fronts for each band. 

Cinder Block's traditional merchandise is clothing, mainly T Shirts though they wanted to expand into selling downloadble music. Rather than use an inhouse system Cinder Block opted to use an external API and chose <a href="http://www.appliedsb.com/">Applied SB</a>.

The project requirements were broadly to do the follwing:

<b>1. Populate the Product Page with API Data
</b>
The Applied SB API provides image, title and price data for each product. For albums it also provides details of each individual track. Cinder Block needed to be able to get all of this data automatically from a single reference code or album_id. We created a Magento extension that handles all of the API communications to grab this data and also uses Magento block caching to keep the performance of the pages fast.

<b>2. Allow Streaming of Sample Music from the Product Page</b>

On the product page Cinder Block wanted visitors to be able to play from within the browser the sample tracks that the Applied SB API provides. Again all of this data is provided by the API and the Magento extension grabs and caches this data automatically. The previews are streamed directly from the Applied SB system and the browser player is based upon Sound Manager.

<b>3. Allow Purchase of Downloadable Music through Standard Checkout Procedure</b>

For upgrade compatability and general ease of use we kept modifications to the checkout procedure to a bear minimum. The downloadable products are standard Magento products in every way. On successful checkout the Magento extension uses the event/observer system in Magento to trigger the extra functionality to register the purchase with the Applied SB and to retrieve the download links and utilise Applied SB's download manager.

This data is stored within a custom order attribute that is set up by the extension and is viewable from within the admin when looking at an order.

<b>4. Supply Download Links Upon Successful Checkout in Account Area and via Email</b>

After retrieving the download links, the extension sends a custom email with the download information. For this we hooked into Magento's standard email templating system allowing Cinder Block to create a custom email template for each store front as they see fit. This works in the exact same way as all of the other email templates within Magento which means its very powerful and configurable.

All in all the project was both challenging and rewarding. We encountered a few setbacks including core Magento bugs which were reported back to Magento and actioned, no doubt they will be fixed in forth coming Magento enterprise releases.

Here is a quote from Mark at Cinder Block:

<blockquote><i>"Despite being faced with many challenges, Joseph worked over time to successfully integrate music downloads into our Magento platform. And the follow up refining has been swift and on the mark. The result is incontestable: It just works. Period. Thanks, Joseph!"</i></blockquote>

Here is a screen shot of one of the product pages including the MP3 previews and also a related products carousel which we threw into the project for free.

{% img  /assets/screenshot-thumb-150x150.png %}

You can see the live page <a href="http://floggingmolly.cinderblock.com/flogging-molly-swagger-album-download.html">here</a>.
