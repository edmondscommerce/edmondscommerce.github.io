---
layout: post
status: publish
published: true
title: Zend Paginator - Actually Pretty Painless :)
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 1328
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=1328
date: 2010-01-27 17:26:08.000000000 +00:00
categories:
- zend framework
tags:
- zend framework
- zend_paginator
---
<div class="oldpost"><h4>This is an old post. The information it contains is probably out of date or innacurate</h4>
<p>
This is a post that was written a long time ago and is only being kept here for posterity.
You should probably look up more recent blog posts related to the subject you are researching
</p>
</div>
With some trepidation I decided that I really had to implement pagination into a Zend Framework project I am working on. Zend Framework is great, but some of the sections can be a little tricky to get your head around at first attempt.

However, less than an hour after first looking at it, I have now got my system spitting out results in a nicely paginated ten at a time. The documentation on the Zend Framework reference is a little sparse but suffice to say that if you are using Zend_Db then actually its pretty easy. 

The only bit that is a little tricky is getting the actual page controls to display, as you are left to code your own (though they do supply some code).

One major irritation with the Zend Framework reference guide is that I seem to be unable to copy and paste the code examples, it ends up looking like this:

```php

      <!--
   2.
      See http://developer.yahoo.com/ypatterns/pattern.php?pattern=searchpagination
   3.
      -->
   4.
       
   5.
      <?php if ($this->pageCount): ?>
   6.
      <div class="paginationControl">
   7.
      <!-- Previous page link -->
   8.
      <?php if (isset($this->previous)): ?>
   9.
        <a href="<?php echo $this->url(array('page' => $this->previous)); ?>">
  10.
          < Previous
  11.
        </a> |
  12.

```

note the line numbers, great.

<a href="http://teethgrinder.co.uk/perm.php?a=Zend-Framework-MySQL-DB-Pagination-Tutorial">this tutorial was really useful though:</a>

Here is some code snippets:

<h3>Controller</h3>
```php

    public function viewAction(){        
        $this->view->input = $input = $this->_request->getPost('search');
        $paginator = $this->_model->tableSearchAllPaginator($input);
        $paginator->setCurrentPageNumber($this->_getParam('page'));
        $this->view->paginator = $paginator;
    }


```
<h3>Model</h3>
```php


    public function tableSearchAllPaginator($input, $fields_to_select=null){
        $table = $this->getTable();
        $select = $table->select();
        $fields = $table->info(Zend_Db_Table_Abstract::COLS);
        if(!empty($input)) {
            foreach($fields as $field) {
                $select->orWhere("$field like ?", "%$input%");
            }
        }
        if(!empty($fields_to_select)) {
            $select->columns($fields_to_select);
        }
        $paginator = new Zend_Paginator(new Zend_Paginator_Adapter_DbTableSelect($select));
        return $paginator;
    }


```
<h3>View Script</h3>
```php

echo $this->partial('_viewtable_page.phtml', array('paginator'=>$this->paginator, 'controller'=>'products'));

```
<h3>View Table Page Partial</h3>
```php

if (count($this->paginator)) {
    echo '<h4>Found ' . count($this->paginator) . ' Results</h4>';
    echo '<table class="grid">';
    foreach($this->paginator as $k=>$row) {
        //EC_Debug::dump($k);
        $row = $row->toArray();
        //EC_Debug::diedump($row);
        if($k == 0) {
            echo '<tr>';
            foreach($row as $f=>$v) {
                echo "<th>$f</th>";
            }
            echo '</tr>';
        }
        echo '<tr>';
        foreach($row as $f=>$v) {
            $extra = '';
            if($f=='id') {
                $extra = '<a href="' . $this->url(array('controller'=>$this->controller, 'action'=>'edit', 'id'=>$v), null, true) . '"><img src="' . $this->baseUrl() . '/style/icons/application_edit.png" border="0" alt="edit"></a>';
                $extra .= ' <a href="' . $this->url(array('controller'=>$this->controller, 'action'=>'delete', 'id'=>$v), null, true) . '"><img src="' . $this->baseUrl() . '/style/icons/cancel.png" border="0" alt="delete"></a>';
            }
            echo "<td>$extra $v</td>";
        }
        echo '</tr>';
    }
    echo '</table>';
    echo $this->paginationControl($this->paginator, 'Sliding', '_paginator.php');
}else{
    echo 'no results...';
}


```
<h3>Pagination Controls Partial</h3>
```php

<?php if ($this->pageCount): ?>
<div class="pagination">

<?php if (isset($this->previous)): ?>
  <a href="<?= $this->url(array('page' => $this->previous)); ?>">« PREV</a> -
<?php endif; ?>

<?php
    /* Page links */

    foreach ($this->pagesInRange as $page): ?>
    <a href="<?= $this->url(array('page' => $page)); ?>" <?php if($page == $this->current): ?>id="selected"><?php endif; ?><?= $page; ?></a>
<?php endforeach; ?>

<?php if (isset($this->next)): ?>
 - <a href="<?= $this->url(array('page' => $this->next)); ?>">Next ></a>
<?php endif; ?>

</div>
<?php endif; ?>

```
