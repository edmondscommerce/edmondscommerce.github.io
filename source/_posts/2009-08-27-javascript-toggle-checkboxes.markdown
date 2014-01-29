---
layout: post
status: publish
published: true
title: Javascript Toggle Checkboxes
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1168
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1168
date: 2009-08-27 15:59:51.000000000 +01:00
categories:
- javascript
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
I seem to use this little snippet loads so I thought I would post it up for safe keeping:

Toggling all checkboxes on a page:

```

<script type="text/javascript">
function toggleCheckboxes() {
// written by Daniel P 3/21/07
// toggle all checkboxes found on the page
  	var inputlist = document.getElementsByTagName("input");
  	for (i = 0; i < inputlist.length; i++) {
   	if ( inputlist[i].getAttribute("type") == 'checkbox' ) {	// look only at input elements that are checkboxes
			if (inputlist[i].checked)	inputlist[i].checked = false
			else								inputlist[i].checked = true;
		}
	}
}
</script>
<button onClick="toggleCheckboxes();">Toggle Enabled Fields</button>

```

I can't remember where I first found it. If you know where it originates please feel free to add a link in the comments
