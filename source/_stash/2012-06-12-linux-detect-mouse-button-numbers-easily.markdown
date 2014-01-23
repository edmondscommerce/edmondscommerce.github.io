---
layout: post
status: publish
published: true
title: Linux Detect Mouse Button Numbers Easily
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3147
wordpress_url: http://www.edmondscommerce.co.uk/?p=3147
date: 2012-06-12 11:49:42.000000000 +01:00
categories:
- linux
tags:
- linux
- grep
- bash
- terminal
- tip
- mouse
- button
- number
- xev
---
If you need to know what number a mouse button is (for example if you are configuring compiz) in Linux then you might like this little trick.

```

xev | grep button

```

Run the above in a terminal and it will display a white box. As you click on it, the button number will appear in your terminal.

The pipe to grep is to filter out the large amount of noise from xev and only display the button number notifications.
