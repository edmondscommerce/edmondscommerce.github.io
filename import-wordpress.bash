#!/bin/bash

set -e

HOST=$1
USER=$2
PASS=$3
DBNAME=$4
PREFIX=$5

if [ "" == "$DBNAME" ]
then
	echo "please run import-wordpress.bash HOST USER PASS DBNAME PREFIX"
	exit 1
fi




function ec_install_mysql-dev(){
	local YUM_CMD=$(which yum)
	local APT_GET_CMD=$(which apt-get)
	if [[ ! -z $YUM_CMD ]]; then
		sudo yum install mysql-devel
	elif [[ ! -z $APT_GET_CMD ]]; then
		sudo apt-get install libmysqlclient-dev
	else
		echo "error can't install package $PACKAGE"
    exit 1;
 fi
}

ec_install_mysql-dev

gem install mysql2
gem install sequel
gem install jekyll-import --pre
if [ "" != "$(which rbenv)" ]
then
	rbenv rehash
fi
ruby -rubygems -e "require 'jekyll-import';
    JekyllImport::Importers::WordPress.run({
      'dbname'   => '$DBNAME',
      'user'     => '$USER',
      'password' => '$PASS',
      'host'     => '$HOST',
      'prefix'   => '$PREFIX',
      'clean_entities' => true,
      'comments'       => false,
      'categories'     => true,
      'tags'           => true,
      'more_excerpt'   => true,
      'more_anchor'    => true,
      'status'         => ['publish']
    })"
