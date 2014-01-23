---
layout: post
status: publish
published: true
title: PHPStorm Regex Replace "Malformed Replacement String"
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3892
wordpress_url: http://www.edmondscommerce.co.uk/?p=3892
date: 2013-01-24 17:39:08.000000000 +00:00
categories:
- phpstorm
tags:
- find
- replace
- php
- problem
- search
- solution
- string
- ide
- regex
- phpstorm
- coding
- regular
- expressions
- malformed
- replacement
---
If you are struggling using PHPStorm to find and replace code with Regex rules then this is your solution.

The problem is that when using the $ sign in your replacement string it confuses it because PHP Storm uses the $ sign to represent sub pattern replacements.

Take the following example code:

```php

$data = array();
$form=$page->find('form.edit_product', 0);

//standard inputs
$inputs = $form->find('input[type="text"]');
foreach($inputs as $input){
    $data[$input->name]=$input->value;
}

//radio inputs
$inputs = $form->find('input[type="radio"]');
foreach($inputs as $input){
    if($input->checked){
        $data[$input->name]=$input->value;
    }
}

//checkbox inputs
$inputs = $form->find('input[type="checkbox"]');
foreach($inputs as $input){
    if($input->checked){
        $data[$input->name]=$input->value;
    }
}

//textareas
$textareas = $form->find('textarea');
foreach($textareas as $textarea){
    $data[$textarea->name]=$textarea->innertext;
}

```

And trying to replace the key being used in the data array with a processed one calling a method $this->dataName($key) to generate the following code:

```php

$data = array();
$form=$page->find('form.edit_product', 0);

//standard inputs
$inputs = $form->find('input[type="text"]');
foreach($inputs as $input){
    $data[$this->dataName($input->name)]=$input->value;
}

//radio inputs
$inputs = $form->find('input[type="radio"]');
foreach($inputs as $input){
    if($input->checked){
        $data[$this->dataName($input->name)]=$input->value;
    }
}

//checkbox inputs
$inputs = $form->find('input[type="checkbox"]');
foreach($inputs as $input){
    if($input->checked){
        $data[$this->dataName($input->name)]=$input->value;
    }
}

//textareas
$textareas = $form->find('textarea');
foreach($textareas as $textarea){
    $data[$this->dataName($textarea->name)]=$textarea->innertext;
}

```

You might try the find pattern:

```

\$data\[\$([^-]+)->name\]

```

And the replace pattern:
```

\$data\[\$this->dataName(\$$1->name)\]

```

However this will give you the dreaded <b>"malformed replacement string"</b> Error

The solution is simply to triple escape your dollar signs, so the replacement pattern becomes:

```

\\\$data\[\\\$this->dataName(\\\$$1->name\)\]

```

And it works, woot!

Also when it does work, PHP Storms replacement preview feature is really quite nice
