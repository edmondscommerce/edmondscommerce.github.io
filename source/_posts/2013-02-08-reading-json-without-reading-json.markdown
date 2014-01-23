---
layout: post
status: publish
published: true
title: Reading JSON without Reading JSON!
author: luke
author_login: luke
author_email: info+luke@edmondscommerce.co.uk
wordpress_id: 3915
wordpress_url: http://www.edmondscommerce.co.uk/?p=3915
date: 2013-02-08 16:16:19.000000000 +00:00
categories:
- programming
tags:
- javascript
- firefox
- development
- internet explorer
- chrome
- tip
- IE9
- json
- opera
---
JSON is a well structure interoperable way of passing data between systems. It's a good way of passing large amount of data into a web page for JavaScript to process and between system on the internet regardless of there architecture or programming language.

JSON is one of the hardest data structure to read directly as a human in it's RAW format compared to other formal grammars such as XML, YAML or ini.

Fortunately there is an easy trick that you can do with Chrome, Firefox with Firebug and even Opera and IE9!

Take the JSON you have, wrap it in "eval()" the same as you would if you where writing a web page (because it is just JavaScript after all) run it and every modern browser this was tested with should allow you to inspect the resulting data structure.

Example JSON:
<code>
{"glossary":{"title":"example glossary","GlossDiv":{"title":"S","GlossList":{"GlossEntry":{"ID":"SGML","SortAs":"SGML","GlossTerm":"Standard Generalized Markup Language","Acronym":"SGML","Abbrev":"ISO 8879:1986","GlossDef":{"para":"A meta-markup language, used to create markup languages such as DocBook.","GlossSeeAlso":["GML","XML"]},"GlossSee":"markup"}}}}}
</code>

<table>
<tr>
<td>
Firefox with Firebug:
{% img  /assets/firefoxjson-600x328.png %}
</td>
</tr>
<tr>
<td>
Chrome:
{% img  /assets/chromejson-600x313.png %}
</td>
</tr>
<tr>
<td>
Opera:
{% img  /assets/bhtAjti.png %}
</td>
</tr>
<tr>
<td>
Internet Explorer 9:
Note: To see this structure you need to click the "Add watcher" link displayed upon running the code.
{% img  /assets/ie9json.png %}
</td>
</tr>
</table>
