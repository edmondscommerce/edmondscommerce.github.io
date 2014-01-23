---
layout: post
status: publish
published: true
title: Adding Confirm E-mail Address Field to Magento Frontend Forms
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2887
wordpress_url: http://www.edmondscommerce.co.uk/?p=2887
date: 2012-01-21 16:44:43.000000000 +00:00
categories:
- magento
tags:
- javascript
- web design
- development
- magento
- ecommerce
- script
- prototype
---
If you are thinking of adding a confirmation of e-mail address to the front-end registration pages of your store e.g the Checkout billing page or the customer account registration, the little snippets below could be of use to you

<strong>For the Checkout billing page</strong>
1. Locate the magento checkout billing page (billing.phtml) which can be found in  app/design/frontend/default/<package_name>/template/checkout/onepage
2. Add code 1 below where situable;
<strong>Code 1</strong>
```html

<div class="field">
<label for="billing:confirm_email" class="required"><em>*</em><?php echo $this->__('Confirm Email Address') ?></label>
<div class="input-box">
<input type="text" name="billing[confirm_email]" title="<?php echo $this->__('Confirm Email') ?>" id="billing:confirm_email" class="input-text required-entry validate-cemail" />
</div>

```
For the validation of this email confirmation field with the actual email field
3. Locate the Javascript file which Magento uses for validation (validation.js) in /js/prototype
4. Add code 3 where suitable e.g immediately after this line(code 2) in validation.js
<strong>Code 2</strong>
```javascript

return !(pass.length < 7);
    }],

```

<strong>Code 3</strong>
```javascript

['validate-cemail', 'Please make sure your emails match.', function(v) {
var conf = $$('.validate-cemail')[0];
var pass = false;
if ($('email')) {
pass = $('email');
}
var emailElements = $$('.validate-email');
for (var i = 0; i < emailElements.size(); i++) {
var emailElement = emailElements[i];
if (emailElement.up('form').id == conf.up('form').id) {
pass = emailElement;
}
}
if ($$('.validate-admin-email').size()) {
pass = $$('.validate-admin-email')[0];
}
return (pass.value == conf.value);
}],

```

Then that should just do exactly what you want.

<strong>For the Customer Account Registration page</strong>

1. Locate the magento account register page ,register.phtml in 
app/design/frontend/<package_name>/default/template/persistent/customer/form/
2. Include code 4 where suitable
<strong>Code 4</strong>
```html

<div class="field">
<label for="confirm_email" class="required"><em>*</em><?php echo $this->__('Confirm Email Address') ?></label>
<div class="input-box">
<input type="text" name="confirm_email" title="<?php echo $this->__('Confirm Email') ?>" id="confirm_email" class="input-text required-entry validate-cemail" />
</div>
</div>

```

After this, you should have another field on your registration page which can be subjected to any styling you need to do, most importantly when styling do not change the tag id's and class names, in a situation where you need to change them, you must also change the javascript selectors accordingly.

I hope this works for you.
