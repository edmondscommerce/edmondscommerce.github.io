#!/bin/bash

HOST=$1
USER=$2
PASS=$3
DBNAME=$4

function install_package(){
	local PACKAGE='$@'
	local YUM_CMD=$(which yum)
	local APT_GET_CMD=$(which apt-get)
	if [[ ! -z $YUM_CMD ]]; then
		sudo yum install $PACKAGE
	elif [[ ! -z $APT_GET_CMD ]]; then
		sudo apt-get install $PACKAGE
	else
		echo "error can't install package $PACKAGE"
    exit 1;
 fi
}

install_package libmysqlclient-dev
gem install mysql2
gem install sequel
gem install jekyll-import --pre
rbenv rehash
ruby -rubygems -e "require 'jekyll-import';
    JekyllImport::Importers::WordPress.run({
      'dbname'   => '',
      'user'     => '',
      'password' => '',
      'host'     => 'localhost',
      'prefix'   => 'wp_',
      'clean_entities' => true,
      'comments'       => false,
      'categories'     => true,
      'tags'           => true,
      'more_excerpt'   => true,
      'more_anchor'    => true,
      'status'         => ['publish']
    })"
