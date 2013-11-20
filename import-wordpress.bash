#!/bin/bash
gem install mysql2
gem install sequel
gem install jekyll-import --pre
ruby -rubygems -e 'require "jekyll-import";
    JekyllImport::Importers::WordPress.run({
      "dbname"   => "",
      "user"     => "",
      "password" => "",
      "host"     => "localhost",
      "prefix"   => "wp_",
      "clean_entities" => true,
      "comments"       => false,
      "categories"     => true,
      "tags"           => true,
      "more_excerpt"   => true,
      "more_anchor"    => true,
      "status"         => ["publish"]
    })'
