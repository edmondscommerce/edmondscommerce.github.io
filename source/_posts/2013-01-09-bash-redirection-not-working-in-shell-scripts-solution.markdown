---
layout: post
status: publish
published: true
title: Bash Redirection not Working in Shell Scripts + Solution
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 3840
wordpress_url: http://www.edmondscommerce.co.uk/?p=3840
date: 2013-01-09 15:54:46.000000000 +00:00
categories:
- bash
tags:
- problem
- solution
- shellscript
- bash
- script
- redirection
- disown
- shee
---
I recently needed to trigger a couple of bash scripts through a web browser.

Unfortunately PHP shell_exec function grinds to a halt when it is used to trigger a long running / memory intensive script when it is used with Apache. 

To get round this I instead wrote the command to a file and then wanted to trigger it using cron. 

However, the commands that were being issues included a redirect and disown which were not being triggered in the following script

```bash

#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
COMMAND=`cat ${DIR}/commandFile | tail -n 1`;
#Check the command
echo ${COMMAND};
# Command is /path/to/file.sh arg1 > /path/to/outputFile & disown
#Run the command
${TEST}

```

After having a play around I found that modifying the file to this will redirect the output and then disown the process

```bash

#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
COMMAND=`cat ${DIR}/commandFile | tail -n 1`;
#Check the command
echo ${COMMAND};
# Command is /path/to/file.sh arg1 > /path/to/outputFile & disown
#Run the command - This line has been changed
eval ${TEST}

```
