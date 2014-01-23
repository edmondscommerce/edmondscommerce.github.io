---
layout: post
status: publish
published: true
title: Server Migration - Pipe Tar from Server to Server using Netcat
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2804
wordpress_url: http://www.edmondscommerce.co.uk/?p=2804
date: 2012-01-06 14:17:46.000000000 +00:00
categories:
- linux
tags:
- linux
- server
- migration
- shell
- bash
- terminal
- script
- tar
- nc
- netcat
- pipe
- transfer
---
If you need to transfer a large amount of data from one server to another you might normally create a large tar archive, send it across and then untar it on the other end.

However a slightly slicker and easier repeated way of doing this is to pipe tar directly from one server to the other doing all three steps in one go.

For this you would create a script on each server. You could of course type the commands directly but in the interests of easy repeatability and removing the scope for human error, scripts are my preferred way of doing this kind of task.

Old server script:

```

#!/bin/bash

cd /var/www/vhosts

# where new server IP is 123.123.123.123 and 9999 is the port the new server is listening on
tar -xvj . | nc 123.123.123.123 9999


```


New Server Script:

```

#!/bin/bash

cd /var/www/vhosts

nc -l 9999 | tar -xvf --same-owner


```

Now save these scripts and make them executable (chmod +x)

Now run the new server script on the new server and then run the old server script. You should quickly see the list of files being transferred appearing in both terminals.

That's it.
