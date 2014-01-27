---
layout: post
status: publish
published: true
title: Zend Framework Easy SQL Info
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1112
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1112
date: 2009-07-13 13:47:52.000000000 +01:00
categories:
- zend framework
tags:
- zend framework
- sql
- queries
- debug
- firebug
- firephp
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
If you develop using Zend Framework you will know that it is sometimes tricky to see exactly whats going on in terms of SQL queries. After trying a few different ideas including subclassing the database classes or other complex systems, the easiest I have found is this:

1. Edit your app.ini config file and add a line:
```

db_profiling_enabled = false

```

Then in your development section in your ini file, set the same value to true

2. Add the following lines to your bootstrap.php after the database adapter setup. 

```php

// DATABASE ADAPTER - Setup the database adapter
// Zend_Db implements a factory interface that allows developers to pass in an 
// adapter name and some parameters that will create an appropriate database 
// adapter object.  In this instance, we will be using the values found in the 
// "database" section of the configuration obj.
$dbAdapter = Zend_Db::factory($configuration->database);
//$dbAdapter = new EC_Db_Mysqli($configuration->database->params);


if($configuration->db_profiling_enabled){
    // create a new profiler
    $profiler = new Zend_Db_Profiler_Firebug('EdmondsCommerce DB Queries Debug');
    // enable profiling (this is only recommended in development mode, disable this in production mode)
    $profiler->setEnabled(true);
    // add the profiler to the database object
    $dbAdapter->setProfiler($profiler);
}

```

Note you may need to move this chunk above the database adapter section:
```php

// CONFIGURATION - Setup the configuration object
// The Zend_Config_Ini component will parse the ini file, and resolve all of
// the values for the given section.  Here we will be using the section name
// that corresponds to the APP's Environment
$configuration = new Zend_Config_Ini(
    APPLICATION_PATH . '/config/app.ini', 
    APPLICATION_ENVIRONMENT
);

```

This is based on a modified quickstart layout for a project. If you have decided to use an alternative layout, you should be able to tell where the relevant code should be.

You will need to have the Firebug firefox extension to view this output. If you also install the FirePHP extension for firebug then there are even more cool things that you can do.
