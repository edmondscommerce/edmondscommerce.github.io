---
layout: post
status: publish
published: true
title: MySQL Triggers - A Quick Guide
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2014
wordpress_url: http://www.edmondscommerce.co.uk/?p=2014
date: 2011-01-15 12:26:09.000000000 +00:00
categories:
- mysql
tags:
- mysql
- data
- triggers
- trigger
- statement
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
MySQL has a nice feature that you may well not have used called Triggers.

These are little SQL statements that are tied to events on table and then perform some extra work.

The idea being that you will check the values for a row and if they meet some conditions you will take some further action. You might usually do this kind of thing in code but if you really must be certain that in a certain circumstance a certain action will be taken, then triggers are a good option because regardless which bit of code makes the change you can be sure your rules will be enforced.

Of course this ties you to a specific DB platform so its not something you should over use. There can also be performance issues so you need to bear that in mind.

Anyway, assuming you know what you are letting yourself in for and have read the <a href="http://www.google.com/search?hl=en&q=site%3Adev.mysql.com+triggers+5.0&aq=f&aqi=&aql=&oq=">documentation</a> here is my little summary.

First you need to give your trigger a name. Choose something descriptive.

Then you need to associate it to an even (UPDATE, INSERT etc) and also decide whether to do it BEFORE or AFTER. If you are not sure, use BEFORE - it's generally the one you want to use.

```sql

CREATE TRIGGER do_something BEFORE UPDATE ON table
...

```

The next bit is boiler plate as far as I can gather, just whack it in. It delimits your actual statement and tells it to be run for each updated row.

```sql

  FOR EACH ROW BEGIN

```

Then do your test

```sql

IF ((NEW.column < 1) AND (OLD.column >=1)) THEN

```

Note the NEW and OLD keywords there. 

You have a choice of using the NEW and OLD keyword to access existing (OLD) and about to be set (NEW) data for each column.

Note also, this is only possible if you use the BEFORE event as opposed to AFTER, hence generally just sticking to using BEFORE

Now, enforce your requirements
```sql

SET NEW.another_column = 0;
SET NEW.and_another_column = 0;
SET NEW.and_another = 'cheese';

```

Then wrap it up

```sql

 END IF;
END;

```

That's it...

BUT WAIT

There's another bit that I totally missed which caused me issues - you need to wrap the whole thing in a delimiter statement:

```sql

delimiter //
... the statement
END;//
delimiter;

```

So the full final thing should look like this:

```sql

delimiter //
CREATE TRIGGER do_something BEFORE UPDATE ON table
  FOR EACH ROW BEGIN
    IF ((NEW.column < 1) AND (OLD.column >=1)) THEN
        SET NEW.another_column = 0;
        SET NEW.and_another_column = 0;
        SET NEW.and_another = 'cheese';
    END IF;
END; //
delimiter;

```

Another point to mention is - just use the CLI for handling these, don't try to use phpMyAdmin etc - it doesn't really work.

