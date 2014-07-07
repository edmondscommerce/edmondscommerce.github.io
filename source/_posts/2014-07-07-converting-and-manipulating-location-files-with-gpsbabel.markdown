---
layout: post
title: "Converting and Manipulating Location Files with GPSBabel"
date: 2014-07-07 10:53:29 +0100
comments: true
author: kenneth
categories: 
tags: 
description: 
---

{% img  /assets/gpsbabel-initial.png %}

GPSBabel was created to enable conversion between the multitude of location file formats, such as GPX and KML, as well as the many formats used by different GPS devices.

Its strength lies in the way it imports data from the source in a format-agnostic way which allows it to make changes to the data using Filters. Notable filters include the ability to use only records from a specific time range, within a specific radius of a specified point, minimise the amount of points in a track and generate tracks from waypoints.

{% img  /assets/gpsbabel-filters.png %}

Other options include the abaility to automnatically generate names, labelled "Synthesize short names", in case your export gives long names as Backitude does.

It's available as a CLI application for Windows, Mac and Linux, with each featuring a GUI for easier discovery of its features. It handily displays the command paramters built up in the GUI for easier automating.
