---
layout: post
status: publish
published: true
title: Git and Sub Module Tips
author: luke
author_login: luke
author_email: info+luke@edmondscommerce.co.uk
wordpress_id: 3891
wordpress_url: http://www.edmondscommerce.co.uk/?p=3891
date: 2013-01-24 17:40:20.000000000 +00:00
categories:
- git
tags:
- development
- git
- tip
---
Using sub modules in git is incredibly useful and allows for easier and more flexible working when working on component based large projects. In a nut shell the use of sub modules (as the name suggests) allows you to include a git repository as a part of another git repository in order to allow you to use the sub modules code without having to duplicate it's content in to your repository.

<h4>Important commands you will need when working with sub modules</h4>
<dl>
<dt><b>git submodule init</b></dt>
<dd>This tells git to read the modules file and make your local repository aware of any sub modules. When you checkout a repository that uses sub modules nothing is done with them until you do this. You will need to run this at least after cloning a repo but possibly after pulling if new sub modules are added.</dd>
<dt><b>git submodule update</b></dt>
<dd>This makes git to update the sub modules to match what the config says it should be. You will probably need this after cloning a repository for the first time or when you pull changes from a remote as some one may have updated the position of the sub module. When running this you should make sure that you don't have any uncommitted changes in any submodules other wise you will lose them and find it hard to retrieve them.</dd>
<dt><b>git submodule add absolute_path/url_to_repo location_of_repo_in_project</b></dt>
<dd>This command tells git to add the repository at the specified URL/path to the repository. Git will add it to the modules file. After adding it you need to commit. The path to the repo either needs to be the absolute path if you are working locally or the URL that is accessible via the Internet/LAN depending on your environment. It has to be like this so that it doesn't matter where the repository that will be cloning the sub module is located</dd>
<dt><b>git help submodule</b></dt>
<dd>Gives you the man page for the submodule command, an invaluable resource</dd>
</dl>

<h4>Key facts when working with sub modules</h4>
<h5>Working in sub modules</h5>
If you want to modify contents of the sub module, that is make changes and commit them back to the sub modules repository, you can work just as normal. The only thing to watch out off is that when you first do <em>git submodule init; git submodule update;</em> it will checkout what ever commit was specified. This means that the sub module might not be on an actual branch but instead only have a particular commit checkout. Make sure to checkout the relevant branch on the sub module before commencing work.

<h5>Updating a sub modules position on a remote repo</h5>
When <em>git submodule update</em> runs it checkouts out the specified commit by the main repository. If there is no commit specified it will checkout the default branch (usually master). If you want it to checkout a specific branch this cannot be done in a literal sense. Instead what you have to do is checkout the top commit of that branch, then commit the changes to the sub module in main repository. This will ensure that the sub module is now at that position when <em>git submodule update</em> is run. You will have to do this every time you want to update it's position.

