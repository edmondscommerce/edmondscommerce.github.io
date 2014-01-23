---
layout: post
status: publish
published: true
title: What is DNS and how does it affect site owners?
author: Kenneth
author_login: kenneth
author_email: info+ken@edmondscommerce.co.uk
wordpress_id: 4176
wordpress_url: http://www.edmondscommerce.co.uk/?p=4176
date: 2013-03-26 15:34:32.000000000 +00:00
categories:
- hosting
tags:
- hosting
- dns
- domaion name
- name server
---
<h2>What DNS is</h2>

<strong>DNS (Domain Name System)</strong> is the system used to make sure that when users type in your web address into their browser, they end up on your website.

<h2>How communication happens on the internet</h2>

When using the web, every site has its own address. It might have extra bits on the start and end, but the core part will be "yoursitename.com", or similar. This is your <strong>Domain Name</strong>.

Behind the scenes, servers have a unique number assigned to them, similar to how houses have phone numbers. This will look something like "123.456.789.000". This is called an <strong>IP Address</strong>.

Like phone numbers, the problem with IP addresses is that they're hard to remember. It's not easy to tell other people a list of numbers and have them remember them when they get home. It's for this reason we have phone books. Fortunately the internet has its own built in way of looking up IP addresses by a name. This is where DNS comes in.

DNS is a way of looking up an IP address by a more memorable name. When you type in "google.com" it's actually being converted into an IP address without you realising.

<h2>How Domain Names are converted into IP Addresses</h2>

When you buy your domain from your registrar, you will also be provided an area where you can set up <strong>DNS Records, also called Zone Records</strong>. This is where you, or your development company, set up the conversion from the Domain Name to the IP address. When this is populated, people accessing your domain are able to end up on your server because of this translation.

In actual fact, this information is spread across the world so that every <strong>DNS Server</strong> in the world (a place where the translation happens) knows what your IP address is, exactly like sharing a phone book with the world.

This translation information is transmitted with a validity period, which is how often other DNS Servers should ask for updates. This is called a "Time To Live", or TTL). This is generally set to a relatively high time, and is the reason you generally have a 24 hour wait period when you change where your site is hosted.

<h2>Separating your Domain Registrar from your Name Server</h2>

It's possible (and not unusual) to have the <strong>Domain Registrar</strong> (the company you bought the domain from) and the <strong>Name Server</strong> (the place where you update these DNS records) in completely different places. This is set up by telling your Registrar where your Name Servers are.

When this is changed, it means that the Registrar is no longer in control of the translation from Domain Name to IP Address

<h2>The General Overview</h2>

So when you access a website, here is what's actually happening behind the scenes

<ul>
<li>You type in the web address into your browser</li>
<li>Your browser asks a DNS Server what the corresponding IP address is</li>
<li>The DNS server sends the IP address back to your computer</li>
<li>Your browser then knows which specific IP address to send subsequent messages to</li>
<li>The browser takes this IP adress and sends a message to the server it's assigned to for the web page</li>
<li>The server sends back the page to your computer, and it's displayed on your screen</li>
</ul>
