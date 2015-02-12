---
layout: post
title: "PageSpeed and issue with images on Safari"
date: 2015-01-30 16:15:13 +0000
comments: true
author: michael
categories: 
- PageSpeed
tags: 
- PageSpeed
- nginx
- apache
- safari
description: "PageSpeed is great for optimisaing images however some older versions of safari may have issues" 
---
Had an issue on a client site where the images were working in all major browser with the exception of safari. The client had page speed installed with the 'rewrite_images' filter enabled.
So it would work with older versions of Safari there are two options:

For the first option we can disable the 'convert_jpeg_to_webp' and 'convert_to_webp_lossless' filters in nginx by using the following after the 'rewrite_images' and 'resize_rendered_image_dimensions' filters:
    pagespeed EnableFilters rewrite_images;
    pagespeed EnableFilters resize_rendered_image_dimensions;
    pagespeed DisableFilters convert_jpeg_to_webp,convert_to_webp_lossless;

In Apache use the following:
    ModPagespeedDisableFilters convert_jpeg_to_webp,convert_to_webp_lossless

Please not that the diable option must be specified after the enable lines for 'rewrite_images' and 'resize_rendered_image_dimensions' filters.

In versions of PageSpeed that are 1.8.31.2 and above there is a new option which is 'ServeRewrittenWebpUrlsToAnyAgent' which will check to see if the client can support webp files on any webp urls that are accessed.

In Nginx to enable this option:
    pagespeed ServeRewrittenWebpUrlsToAnyAgent off;
Alternatively in apache the setting is:
    ModPagespeedServeRewrittenWebpUrlsToAnyAgent off
