---
layout: post
status: publish
published: true
title: PHP SOAP Client Basic Template
author: Joseph Edmonds
author_login: joseph
author_email: info+joseph@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 4404
wordpress_url: http://www.edmondscommerce.co.uk/?p=4404
date: 2013-07-08 08:28:17.000000000 +01:00
categories:
- php
tags:
- php
- client
- magento
- xml
- debug
- api
- soap
- webservice
- asp.net
---
Often when integrating with SOAP services I find myself doing the same old moves. I have a deep suspicion of API's written by others. They always tend to be in ASP.net, have error message pages that have default messages and generally be really badly documented and coded. Maybe I'm just unlucky?

In my experience decent API's don't use SOAP.

Anyway if I do have to use SOAP, starting out with this class as a template to get the ball rolling with some useful debugging methods (so you can email the API owners and show them that their API doesn't work), I've blogged it for my own archive and retrieval reasons but if it helps anyone else out then that is great!

```php

<?php
/**
 * Class Template Soap Client Consuming Class
 */

class EdmondsCommerceSoap
{

    protected $username = 'edmondscommerce';

    protected $pass = 'NotReallyMyPassw0rd';


    public function test($wsdl)
    {
        $options["connection_timeout"] = 25;
        $options["location"] = $wsdl; 
        $options['trace'] = 1; //this is important if you want to be able to use the soapDebug method
        try {
            $client = new SoapClient($wsdl, $options);
            $client = $this->setAuthHeader($client);
            $client->Method();
        } catch (SoapFault $e) {
            echo '<h1>SoapFault: ' . $e->getMessage() . '</h1>';
            echo '<pre>' . $e->getTraceAsString() . '</pre>';
        }
        echo '<h2>Debug Info:</h2>';
        var_dump($this->soapDebug($client));
    }

    /**
    * This method is only a template, will change depending on the service you are using but its a good starting point demonstrating how to set headers
    **/
    protected function setAuthHeader(SoapClient $client)
    {
        $auth = array(
            'username' => $this->username,
            'MessageId' => md5(time()),
            'password' => $this->password
        );
        foreach($auth as $k=>$v){
            $headers[] = new SoapHeader('Header', $k, $v, false);
        }
        $client->__setSoapHeaders($headers);
        return $client;
    }

    /**
     *  This method gathers all debug info into a handy array ready for var_dump, log etc etc
     **/
    protected function soapDebug(SoapClient $client)
    {
        $debug = array();
        $debug['request']['headers'] = $client->__getLastRequestHeaders();
        $debug['request']['body'] = $client->__getLastRequest();
        $debug['request']['body_formatted'] = $this->formatXmlString($client->__getLastRequest());
        $debug['response']['headers'] = $client->__getLastResponseHeaders();
        $debug['response']['body'] = $client->__getLastResponse();
        $debug['response']['body_formatted'] = $this->formatXmlString($client->__getLastResponse());
        return $debug;
    }


    /**
     * This method is purely to assist the debug method and simply makes generated XML readable
     **/
    protected function formatXmlString($xml)
    {
        $xml = preg_replace('/(>)(<)(\/*)/', "$1\n$2$3", $xml);
        $token = strtok($xml, "\n");
        $result = '';
        $pad = 0;
        $matches = array();
        while ($token !== false) :
            if (preg_match('/.+<\/\w[^>]*>$/', $token, $matches)) :
                $indent = 0; elseif (preg_match('/^<\/\w/', $token, $matches)) :
                $pad--;
                $indent = 0; elseif (preg_match('/^<\w[^>]*[^\/]>.*$/', $token, $matches)) :
                $indent = 1; else :
                $indent = 0;
            endif;
            $line = str_pad($token, strlen($token) + $pad, ' ', STR_PAD_LEFT);
            $result .= $line . "\n";
            $token = strtok("\n");
            $pad += $indent;
        endwhile;
        return $result;
    }

}

```
