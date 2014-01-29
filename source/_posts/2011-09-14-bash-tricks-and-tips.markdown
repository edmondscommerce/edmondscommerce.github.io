---
layout: post
status: publish
published: true
title: Bash Tricks and Tips
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2627
wordpress_url: http://www.edmondscommerce.co.uk/?p=2627
date: 2011-09-14 18:24:14.000000000 +01:00
categories:
- linux
tags:
- ubuntu
- linux
- bash
- script
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
<h3>The <strong>for</strong> command</h3>
The for command is extremely useful for working with a group of files, it can be used with a glob (e.g. "*.jpg"), the output of a command (e.g. grep) or an internal command such as expr.  Two examples :-<br/>
Combining with imagemagic's convert command to convert a directory's png files to jpegs :-
<code>for f in *.png; do echo convert  "$f" `basename "$f" .png` .jpg; done</code>
Combining with expr to run a command 8 times :-
<code>for i in `seq 1 8` do echo "hello world $i of 8"; done</code>
<h3>cd tricks (and pushd/popd)</h3>
One of the most used commands in the unix world, a lot of people don't know that it actually remembers the last place you were!
<code>cd /
ls (should be in / now)
cd /usr
ls (now in /usr)
cd -</code>
Takes you to the directory you just changed from - in this case /
Take this to the next level and you get pushd and popd.  These two commands maintain a directory "stack" - pushd puts a directory onto the top of the stack and popd pulls it back off the top.
<code>cd /
ls (in /)
pushd /usr
ls (in /usr)
cd share
ls (in /usr/share)
popd
ls (in /)
</code>
Also not extremely well known, cd with no arguments takes you to your home directory, the same way cd ~ does
<h3>Startup files</h3>
There are so many places that get called on startup of a terminal, that it can be a bit difficult to decide where to put things to be run every time.
There are three types of shells - login, interactive and non-interactive, each calling different startup files.
To borrow from a linuxquestions answer here, an explanation of the differences in where the startup goes :-
<code>Login shells:
On login (subject to the -noprofile option):
if /etc/profile exists, source it.

if ~/.bash_profile exists, source it,
else if ~/.bash_login exists, source it,
else if ~/.profile exists, source it.

On exit:
if ~/.bash_logout exists, source it.

Non-login interactive shells:
On startup (subject to the -norc and -rcfile options):
if ~/.bashrc exists, source it.

Non-interactive shells:
On startup:
if the environment variable ENV is non-null, expand
it and source the file it names, as if the command
if [ "$ENV" ]; then . $ENV; fi
had been executed, but do not use PATH to search
for the pathname. When not started in Posix mode, bash
looks for BASH_ENV before ENV.</code>
Note that often scp will break if you output anything in certain startup scripts, do check that you can still scp.
Also, if you're in a gui environment there are other useful startup files, for instance .gnomerc

<h3>Aliases</h3>

It is possible to alias a long command to a shorter name as follows :-
<code>alias martyn='su - martyn'</code>
as an example.
type alias on it's own to see the list of aliases installed on your system (you might be surprised that there are any, and you may use some of them already!).
These can be stored in your startup file (see above to decide which) by using the append to file redirector as follows
<code>echo "alias martyn='su - martyn'" >> ~/.bashrc</code>

Happy bashing!
