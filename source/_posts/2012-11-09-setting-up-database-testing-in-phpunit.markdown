---
layout: post
status: publish
published: true
title: Setting up database testing in PHPUnit
author: Ross Mitchell
author_login: ross
author_email: info+ross@edmondscommerce.co.uk
wordpress_id: 3606
wordpress_url: http://www.edmondscommerce.co.uk/?p=3606
date: 2012-11-09 17:34:45.000000000 +00:00
categories:
- php
tags:
- mysql
- development
- php
- problem
- solution
- phpunit
---
I have recently been trying to write unit tests for a piece of code that reads and writes to a database.

As I have spent far too much time trying to get this to work, this is here to act as an <em>aide-mémoire </em>for the next time that I have to do this.

This is the actual class that is used

```php

<?php
require_once __DIR__ . '/DataPump.php';
/**
 * These are required to ensure that the PDO object in the class is able to work correctly
 * @backupGlobals disabled
 * @backupStaticAttributes disabled
 */
class DataPumpTest extends PHPUnit_Extensions_Database_TestCase
{

    /**
     * This is the object that will be tested
     * @var DataPump
     */
    protected $object;
    
    /**
     * only instantiate pdo once for test clean-up/fixture load
     * @var PDO
     */
    static private $pdo = null;

    /**
     * only instantiate PHPUnit_Extensions_Database_DB_IDatabaseConnection once per test
     * @var type 
     */
    private $conn = null;

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     */
    protected function setUp()
    {
        $this->object = new DataPump;
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     */
    protected function tearDown()
    {
        
    }
    
    protected function getConnection()
    {
        if ($this->conn === null) {
            if (self::$pdo == null) {
                self::$pdo = new PDO('mysql:dbname=testing_database;host=localhost', 'dbUserName', 'dbPassword');;
            }
            $this->conn = $this->createDefaultDBConnection(self::$pdo, 'ross_testing');
        }
        return $this->conn;
    }

    protected function getDataSet()
    {
        return $this->createMySQLXMLDataSet(__DIR__ . '/datapump.xml');
    }

    /**
     * This is here to ensure that the database is working correctly
     */
    public function testDataBaseConnection()
    {
        
        $this->getConnection()->createDataSet(array('products'));
        $prod = $this->getDataSet();
        $queryTable = $this->getConnection()->createQueryTable(
            'products', 'SELECT * FROM products'
        );
        $expectedTable = $this->getDataSet()->getTable('products');
        //Here we check that the table in the database matches the data in the XML file
        $this->assertTablesEqual($expectedTable, $queryTable);
    }
    /**
     * This is where you can put your actual tests
     */
}

```

The following steps need to be taken to get everything here to work.

You need to create the testing database and tables before you can do anything else. This includes the tables that you will be reading from and the tables that you will eventually write to.

You then need to create an XML file for the data that you are expecting. I suggest checking that the data from the read table is included in this, so you can confirm that you are working with the correct data.

You can generate the data that is already in the database using the following command
<code>
mysqldump --xml -t -u username -p testing_database products > datapump.xml
</code>
Which will give you a file like this

```xml

<?xml version="1.0"?>
<mysqldump xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <database name="testing_database">
        <table_data name="products">
            <row>
                <field name="products_id">1000001</field>
                <field name="products_quantity">31</field>
                <field name="products_model">example1</field>
                <!-- ... -->
            </row>
            <row>
                <field name="products_id">1000002</field>
                <field name="products_quantity">15</field>
                <field name="products_model">example2</field>
                <!-- ... -->
            </row>
        </table_data>
    </database>
</mysqldump>

```

The two variables in the assertTablesEqual methods are just strings, which means if after you have set everything up and the test is failing, it is possible to export them to check where the differences are.

The big problem I had was that some export methods escaped ampersands, whilst others did not. Correcting this allowed the test to path.
