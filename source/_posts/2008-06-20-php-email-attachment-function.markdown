---
layout: post
status: publish
published: true
title: PHP Email Attachment Function
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 57
wordpress_url: http://www.edmondscommerce.co.uk/blog/php/php-email-attachment-function/
date: 2008-06-20 13:02:03.000000000 +01:00
categories:
- php
- email
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
Sending an email with PHP is pretty straight forwards. It's very useful for emailing reports generated from cron jobs etc.

Sometimes though you need your application to email an attachment.

After a load of messing around I have hacked together this email attachment PHP function.

```php

function email_attachment($to_email, $email, $subject,$our_email_name, $our_email, $file_location, $default_filetype='application/zip'){
	$email = '<font face="arial">' . $email . '</font>';
	$fileatt = $file_location;
	if(function_exists(mime_content_type)){
		$fileatttype = mime_content_type($file_location); 
	}else{
		$fileatttype = $default_filetype;;
	}
	$fileattname =basename($file_location);
	//prepare attachment
	$file = fopen( $fileatt, 'rb' ); 
	$data = fread( $file, filesize( $fileatt ) ); 
	fclose( $file );
	$data = chunk_split( base64_encode( $data ) );
	//create mime boundary
	$semi_rand = md5( time() ); 
	$mime_boundary = "==Multipart_Boundary_x{$semi_rand}x"; 
	//create email  section
	$message = "This is a multi-part message in MIME format.\n\n" . 
	"--{$mime_boundary}\n" . 
	"Content-type: text/html; charset=us-ascii\n" . 
	"Content-Transfer-Encoding: 7bit\n\n" . 
	$email . "\n\n";
	 //create attachment section
	$message .= "--{$mime_boundary}\n" . 
	 "Content-Type: {$fileatttype};\n" . 
	 " name=\"{$fileattname}\"\n" . 
	 "Content-Disposition: attachment;\n" . 
	 " filename=\"{$fileattname}\"\n" . 
	 "Content-Transfer-Encoding: base64\n\n" . 
	 $data . "\n\n" . 
	 "--{$mime_boundary}--\n";
	 //headers
	$exp=explode('@', $our_email);
	$domain = $exp[1];
	$headers = "From: $our_email_name<$our_email>" . "\n";
	$headers .= "Reply-To: $our_email"."\n";
	$headers .= "Return-Path: $our_email" . "\n";    // these two to set reply address
	$headers .= "Message-ID: <".time()."@" . $domain . ">"."\n";
	$headers .= "X-Mailer: Edmonds Commerce Email Attachment Function"."\n";          // These two to help avoid spam-filters
	$headers .= "Date: ".date("r")."\n";
	$headers .= "MIME-Version: 1.0\n" . 
                    "Content-Type: multipart/mixed;\n" . 
                    " boundary=\"{$mime_boundary}\"";
	 
	mail($to_email,$subject,$message, $headers, '-f ' . $our_email) or die ('<h3 style="color: red;">Mail Failed</h3>');
}

```

The PHP and Email Journey Continues :-)

For a fully featured <a href="http://www.phpclasses.org/browse/package/2822.html" rel="nofollow">email attachment class</a> this is definitely worth checking out. If you just want a quick function though without any bells and whistles then you should find my function will do the trick.
