---
layout: post
status: publish
published: true
title: Extending Mage Core Encryption Model to handle Legacy Passwords
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 3096
wordpress_url: http://www.edmondscommerce.co.uk/?p=3096
date: 2012-04-26 12:35:29.000000000 +01:00
categories:
- magento
tags:
- magento
- xml
- override
- solution
- config.xml
- password
- tip
- legacy
- encryption
- encryptor
- top
- hair
---
If you are migrating from an old ecommerce package into Magento, you may well want to extend Magento's password hashing system so that it can understand the passwords that are hashed by the previous system and customers can log in using their old passwords without any hassle.

You would start off by overriding the Mage_Core_Model_Encryption class like so:

```php

class EdmondsCommerce_LegacyPassword_Model_Encryption extends Mage_Core_Model_Encryption {

    /**
     * Validate hash against hashing method (with or without salt)
     * 
     * Extended to support the legacy password hashing of the previous system
     *
     * @param string $password
     * @param string $hash
     * @return bool
     * @throws Exception
     */
    public function validateHash($password, $hash) {
        if (/*password matches legacy pattern (as stored hash in DB)*/) {            
            // create a hash of the plain text password and compare to the stored hash
            return $hashed_pass == $hashval;
        }
        //default magento hashing from here
        return parent::validateHash($password, $hash);
    }

}

```

However, you will find that the standard model override does not work and you may start vigorous hair pulling at this point.

The answer though is that your override XML is actually fine, but it isn't being used. This is because of the getEncryptor model in Mage_Core_Helper_Data creates the model using 'new' rather than getModel.

```php

/**
     * @return Mage_Core_Model_Encryption
     */
    public function getEncryptor()
    {
        if ($this->_encryptor === null) {
            $encryptionModel = (string)Mage::getConfig()->getNode(self::XML_PATH_ENCRYPTION_MODEL);
            if ($encryptionModel) {
                $this->_encryptor = new $encryptionModel;
            } else {
                $this->_encryptor = Mage::getModel('core/encryption');
            }

            $this->_encryptor->setHelper($this);
        }
        return $this->_encryptor;
    }

```

The class name to use for the encryptor is stored in the config.xml for Mage_Core.

The solution here is to replicate this XML in your config.xml and also make your legacy module depend on Mage_Core so that it get loaded afterwards and can override the XML.

```xml

<?xml version="1.0"?>
<config>
    <modules>
        <EdmondsCommerce_LegacyPassword>
            <version>0.1.1</version>
            <depends>Mage_Core</depends>
        </EdmondsCommerce_LegacyPassword>
    </modules>
    <global>
        <models>
            <core>
                <rewrite>
                    <encryption>EdmondsCommerce_LegacyPassword_Model_Encryption</encryption>
                </rewrite>
            </core>
        </models>
        <helpers>
            <core>
                <encryption_model>EdmondsCommerce_LegacyPassword_Model_Encryption</encryption_model>
            </core>
        </helpers>
    </global>    
</config>

```

Easy once you understand. Another gotcha you have to look out for though!
