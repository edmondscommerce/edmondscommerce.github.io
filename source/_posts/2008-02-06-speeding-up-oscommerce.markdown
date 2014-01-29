---
layout: post
status: publish
published: true
title: Speeding Up osCommerce
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 7
wordpress_url: http://www.edmondscommerce.co.uk/blog/oscommerce/speeding-up-oscommerce/
date: 2008-02-06 17:14:24.000000000 +00:00
categories:
- oscommerce
tags:
- oscommerce
- speed
- performance
- tuning
- ''
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
osCommerce is a great ecommerce package which is hugely popular due to its full feature set, massive options for customisation and a huge support base. However if you want to run a large catalogue, or have plenty of visitors then speed can become an issue. There are  a <a href="http://www.oscommerceblog.com/index.php/2007/01/08/oscommerce-performance-and-speed-issues-resolution/" target="_blank">number of things</a> you should look at to increase the overall speed of your osCommerce store

The problem is in the way that osCommerce has evolved, and also in the way that they have tried to make the code base as portable as possible. This means that as standard, the software may be doing quite a few processes that are not really necessary for your store.

One of the biggest culprits of page load time problems, especially on sites with large catalogues is the split_page_results class.  In standard trim, the class performs the most complex query of your catalogue page twice - once to find the number of rows and a second time to actually grab the results. On a small site you may not notice this, but on a larger site this query can represent a large portion of the total page load time.

The answer is to modify the class so that it uses the SQL_CALC_FOUND_ROWS functionality to simultaneously perform the query and calculate the total number of rows. Then to get this number of rows, you only have to select FOUND_ROWS() instead of performing the whole query again.

```php


$count_query = str_replace('select', 'select SQL_CALC_FOUND_ROWS ', $this->sql_query);
if(!isset($this->current_page_number)){
$this->current_page_number = 1;
}
$current_limit = " limit " . ((($this->current_page_number -1) * $this->number_of_rows_per_page)) .', ' . $this->number_of_rows_per_page;
$this->sql_query = $count_query . $current_limit;
$this->sql_query = tep_db_query($this->sql_query);
$count = tep_db_query("select FOUND_ROWS()");
$this->number_of_rows = mysql_result($count, 0);


```
