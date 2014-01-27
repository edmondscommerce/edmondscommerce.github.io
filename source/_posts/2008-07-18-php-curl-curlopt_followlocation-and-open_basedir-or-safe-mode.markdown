---
layout: post
status: publish
published: true
title: PHP, cURL, CURLOPT FOLLOWLOCATION and open basedir Or Safe Mode
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 65
wordpress_url: http://www.edmondscommerce.co.uk/blog/curl/php-curl-curlopt_followlocation-and-open_basedir-or-safe-mode/
date: 2008-07-18 13:09:13.000000000 +01:00
categories:
- curl
tags:
- edmondscommerce
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you are trying to get a curl script which needs follow on location functionality to run on a server which has either open_basedir or safe mode enabled you will get an error message similar to the following:

<strong>CURLOPT_FOLLOWLOCATION cannot be activated when in safe_mode or an open_basedir is set</strong>

After a bit of digging, some kind soul has put a workaround <a href="http://au.php.net/manual/ro/function.curl-setopt.php#71313">here</a>

Here is how to use the function

```php


function curl($url){
$go = curl_init($url);
curl_setopt ($go, CURLOPT_URL, $url);
//follow on location problems

if (ini_get('open_basedir') == '' && ini_get('safe_mode' == 'Off')){

curl_setopt ($go, CURLOPT_FOLLOWLOCATION, $l);

$syn = curl_exec($go);

}else{

$syn = curl_redir_exec($go);

}

curl_close($go);
return $syn;
}

//follow on location problems workaround

function curl_redir_exec($ch)

{

static $curl_loops = 0;

static $curl_max_loops = 20;

if ($curl_loops++ >= $curl_max_loops)

{

$curl_loops = 0;

return FALSE;

}

curl_setopt($ch, CURLOPT_HEADER, true);

curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$data = curl_exec($ch);

list($header, $data) = explode("\n\n", $data, 2);

$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

if ($http_code == 301 || $http_code == 302)

{

$matches = array();

preg_match('/Location:(.*?)\n/', $header, $matches);

$url = @parse_url(trim(array_pop($matches)));

if (!$url)

{

//couldn't process the url to redirect to

$curl_loops = 0;

return $data;

}

$last_url = parse_url(curl_getinfo($ch, CURLINFO_EFFECTIVE_URL));

if (!$url['scheme'])

$url['scheme'] = $last_url['scheme'];

if (!$url['host'])

$url['host'] = $last_url['host'];

if (!$url['path'])

$url['path'] = $last_url['path'];

$new_url = $url['scheme'] . '://' . $url['host'] . $url['path'] . ($url['query']?'?'.$url['query']:'');

curl_setopt($ch, CURLOPT_URL, $new_url);

return curl_redir_exec($ch);

} else {

$curl_loops=0;

return $data;

}

}


```
