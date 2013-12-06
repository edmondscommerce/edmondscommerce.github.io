---
layout: post
status: publish
published: true
title: Using Bitbucket on Windows using TortoiseGit
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 4369
wordpress_url: http://www.edmondscommerce.co.uk/?p=4369
date: 2013-06-11 12:00:31.000000000 +01:00
categories:
- Windows
- magento
- git
tags:
- git
- Windows
- tortoisegit
- ssh key
- puttygen
---
<h2>Install TortoiseGit</h2>

TortoiseGit is a Windows GIU for using Git on Windows, integrating nicely with Windows Explorer.

<a href="http://code.google.com/p/tortoisegit/wiki/Download?tm=2" target="_blank">Download TortoiseGit</a> and install it.

<h2>Install and set up PuTTYgen</h2>

PuTTYgen is a program used to create SSH keys on Windows, the Public-Private-Key encryption used by SSH in place of passwords, you'll need these to authenticate with Bitbucket.

<a href="http://the.earth.li/~sgtatham/putty/latest/x86/puttygen.exe" target="_blank">Download PuTTYgen</a> and install it.

Once installed, you'll need to set up a public and private key. Open PuTTYgen from your Start menu/screen and follow the instructions on the screen. Once you've generate the key, save both the Prive and Public keys to your computer.

<h2>Add your keys to Bitbucket</h2>

<ul>
	<li>Log in to Bitbucket navigate to Manage Account > SSH Keys > Add Key</li>
	<li>Right-click your public key file and open in a text editor</li>
	<li>Remove the lines beginning with -- and the Comment line</li>
	<li>Remove any remaining line breaks</li>
	<li>Prepend the key with "ssh-rsa " - including the space</li>
	<li>Paste this into the Key field</li>
</ul>

<h2>Clone the repository</h2>
<ul>
	<li>Right-click a folder in Explorer > Git Clone</li>
	<li>Copy the repository access from the Repository's main page, on the right next to the SSH button</li>
	<li>Paste this into the URL field of TortoiseGit</li>
	<li>Tick Load Putty Key, and add your Private key from PuTTYgen</li>
</ul>

<h2>Switching Branches</h2>

<ul>
	<li>Enter your local repository's folder</li>
	<li>Right-click an empty space > TortoiseGit > Switch/Checkout...</li>
	<li>Select your branch from the dropdown</li>

</ul>

<h2>Committing changes</h2>

<ul>
	<li>Right-click an empty space</li>
	<li>Click Git Commit -> "branchname"</li>
	<li>Add a commit message</li>
</ul>

When you're ready to push your changes to Bitbucket

<ul>
	<li>Right-click an empty space</li>
	<li>Click TortoiseGit > Push...</li>

</ul>




