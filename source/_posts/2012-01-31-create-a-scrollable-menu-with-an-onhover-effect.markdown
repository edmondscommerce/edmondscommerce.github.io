---
layout: post
status: publish
published: true
title: Create a scrollable menu with an onHover effect
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 2922
wordpress_url: http://www.edmondscommerce.co.uk/?p=2922
date: 2012-01-31 14:51:37.000000000 +00:00
categories:
- jquery
tags:
- web design
- Cascading Style Sheets
- design
- problem
- jquery
- solution
- menus
---
I was recently asked by a client to create a scrollable, navigation menu for their site. However, they wanted it to have an onHover submenu that expanded to the side, over the top of the scrollbar.

The problem with this is that there is noway to do this using normal css, over the overflow:scroll hides the sub menu. If you put the submenus into a different div outside the scrollable area, then you can run into problems with the onHover thinking you've left the target.

To get round this I put together the following jQuery, HTML and CSS, which I hope will help someone.

```html

<div class="categories">
	<ul>
		<li class="level0 first parent">
			<a href="path/to/link">
			<p>First Item</p>
			</a>
			<ul style="display:none">
				<li class="level1 first parent">
					<a href="path/to/link">
						<p>sublevel-1</p>
					</a>
					<ul style="display:none">
						<li class="level2 first">
							<a href="path/to/link">
								<p>sub-sublevel1</p>
							</a>
						</li>
					</ul>
				</li>
			</ul>
		</li>
		<li class="level0">
			<a href="path/to/link">
				<p>Second Item</p>
			</a>
		</li>
	</ul>
	<div id="hoverMenu" style="display: none; ">
		<div id="subHoverMenu" style="display: none; "></div>
	</div>
</div>

```

```css

.categories{background:white;height:310px;overflow:scroll;overflow-x:hidden;}
.categories .active{background:red;}
.categories ul{padding:9px 10px 0 10px;}
.categories ul li a{color:black;height:21px;line-height:21px;}
.categories ul li a p{font-size:13px;padding:0 0 0 0;margin:0 0 0 0;white-space:nowrap;}
.categories #hoverMenu{background:white;height:auto;position:absolute;width:auto;z-index:150;} 
.categories #hoverMenu .active{background:red;}
.categories #hoverMenu li{padding:5px 10px 5px 20px;}
.categories #hoverMenu p{color:black;font-size:13px;white-space:nowrap;}
.categories #hoverMenu #subHoverMenu{background:white;width:auto;height:auto;position:absolute;z-index:150;}
.categories #hoverMenu #subHoverMenu .active{background:red;}

```

```javascript

	jQuery(document).ready(function() {
		jQuery(".categories li.level0").mouseenter(function() {
			jQuery(this).siblings().removeClass('active');
			jQuery(this).addClass('active');
			if(jQuery(this).hasClass('parent')) {
				jQuery('#hoverMenu ul').remove();
				var pos = jQuery(this).position(); 
				var mouseX = pos.left + 175;
				var mouseY = pos.top; 
				var subMenu=jQuery(this).children('ul:first')
				subMenu.clone(true, true).show().appendTo('#hoverMenu');
				jQuery('#hoverMenu').css({'top':mouseY,'left':mouseX});
				jQuery('#hoverMenu').show();
			} else {
				jQuery('#hoverMenu ul').remove();
				jQuery('#hoverMenu').hide();
			}
		})
		
		jQuery(".categories li.level1").bind('mouseenter', function() {
			jQuery(this).siblings().removeClass('active');
			jQuery(this).addClass('active');
			if(jQuery(this).children('ul').length) {
				jQuery('#subHoverMenu').empty();
				var subPos = jQuery(this).position();
				var subMouseX = jQuery(this).outerWidth();
				var subMouseY = subPos.top; 
				var subSubMenu=jQuery(this).children('ul:first')
				subSubMenu.clone(true, true).show().appendTo('#subHoverMenu');
				jQuery('#subHoverMenu').css({'top':subMouseY,'left':subMouseX});
				jQuery('#subHoverMenu').show();
			} else {
				jQuery('#subHoverMenu').empty().hide();
			}
		})
		
		jQuery(".categories li.level2").bind('mouseenter', function() {
			jQuery(this).siblings().removeClass('active');
			jQuery(this).addClass('active');
		})
		
		jQuery('#hoverMenu').mouseleave(function(){
			jQuery('#hoverMenu ul').remove();
			jQuery('#hovermenu').hide();
			jQuery('#subHoverMenu').empty().hide();
		})
		
		jQuery('#subHoverMenu').mouseleave(function(){
			jQuery(this).empty().hide();
		})
		
		jQuery('.categories').mouseleave(function() {
			jQuery('#hoverMenu ul').remove();
			jQuery('#hoverMenu').hide();
			jQuery('#subHoverMenu').empty().hide();
			jQuery(".col-left .category-list .categories li").removeClass('active');
		})
	})

```

Obviously, change styles and content as required
