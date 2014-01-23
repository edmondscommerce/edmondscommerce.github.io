---
layout: post
status: publish
published: true
title: PHP Swift Mailer Not Working with Google Apps
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2707
wordpress_url: http://www.edmondscommerce.co.uk/?p=2707
date: 2011-10-31 21:34:07.000000000 +00:00
categories:
- php
tags:
- google
- php
- bug
- gmail
- email
- smtp
- apps
- tls
- phpmailer
- helo
- STARTTLS
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
If you are struggling trying to get PHPMailer working with Google Apps then perhaps this is the solution for you.

I went to the PHPMailer site and found my way to a SourceForge download. After a lot of debugging and wrestling with this I just could not get it to work. In the end I looked at other projects that I knew were using PHPMailer for their mail and that were working with Google Apps or Gmail and found that their version was drastically more up to date than the one I downloaded from SourceForge. 

In a nutshell - the version I had was never going to work.

A quick update later and I have PHPMailer working with Google Apps.

For reference the version <a href="https://github.com/KyleAMathews/phpmailer/blob/master/class.phpmailer.php">here</a> seems to be the up to date.

Here is some example code that IS working with Google Apps

```php

<pre>
    <?php
    $to = 'info@edmondscommerce.co.uk';
    $message = 'testing swift mailer';

    require("class.phpmailer.php");

    $mail = new PHPMailer();

    $mail->IsSMTP();
    $mail->SMTPAuth = true;
    $mail->SMTPSecure = 'tls';
    $mail->Host = 'smtp.gmail.com';
    $mail->Port = 587;

    $mail->Username = 'your@email.com';
    $mail->Password = 'yourpasswordwhatever';

    $mail->From = $to;
    $mail->FromName = 'test';
    $mail->Subject = 'test';
    $mail->WordWrap = 50; // set word wrap

    $mail->Body = eregi_replace("[\]", '', $message);

    $mail->IsHTML(true); // send as HTML
//To
    $mail->AddAddress($to);
    $mail->SMTPDebug = true;

    $mail->CharSet = 'us-ascii';
    $mail->Encoding = $mail->Charset != 'us-ascii' ? '8bit' : '7bit';

    if (!$mail->Send()) {
        echo "Message could not be sent. <p>";
        echo "Mailer Error: " . $mail->ErrorInfo;
        exit;
    }
    echo "Message has been sent";


```
