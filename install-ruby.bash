#!/bin/bash
set -e

echo "Setting up Linux Required Packages
"
if [ "" != "$(which yum)" ]
then
	sudo yum -y install gcc-c++ openssl-devel readline libyaml-devel readline-devel zlib zlib-devel

elif [ "" != "$(which apt-get)" ]
then
	sudo apt-get install build-essential autoconf libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev
else
	echo "ERROR - failed detecting package manager"
	exit 1
fi
echo "done..
"


## Set the Ruby Manager you want to use, if one doesn't work, try the other one.
#RUBY_MANAGER=rbenv
RUBY_MANAGER=rvm


if [ "$RUBY_MANAGER" = "rbenv" ]
then

	# having major issues getting this to work

	echo "
	Grabbing rbenv Repo"
	cd ~
	if [[ ! -d ~/.rbenv ]]
	then
		git clone git://github.com/sstephenson/rbenv.git .rbenv
		echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
		echo 'eval "$(rbenv init -)"' >> ~/.bashrc
		git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
		source ~/.bashrc
		echo "done..
	"
	fi



	echo "
	Installing Ruby 2.0.0-p247"
	rbenv install 2.0.0-p247
	rbenv global 2.0.0-p247
	rbenv rehash
	echo "done..
	"
elif [ "$RUBY_MANAGER" = "rvm" ]
then

	echo "
	Getting RVM
	"
	curl -L https://get.rvm.io | bash -s stable
	source ~/.rvm/scripts/rvm	
	rvm install 2.0.0 --autolibs=1 --verify-downloads 1
	rvm use 2.0.0

else
	echo "ERROR - no valid RUBY_MANAGER set"
	exit 1;
fi




echo "
check Ruby version here:"
ruby --version


echo "
Now install Octopress"
cd ~
if [[ ! -d ~/octopress ]]
then
	git clone git://github.com/imathis/octopress.git octopress
fi
cd octopress
gem install bundler
if [ "$RUBY_MANAGER" = "rbenv" ]
then
	rbenv rehash    # If you use rbenv, rehash to be able to run the bundle command
fi
bundle install
rake install
echo "done"


echo "
Now hooking up to Github pages"
cd ~
echo "repo name is:"
echo "git@github.com:edmondscommerce/edmondscommerce.github.io.git
"
rake setup_github_pages
rake generate
rake deploy
git remote add origin git@github.com:edmondscommerce/edmondscommerce.github.io.git
git config branch.master.remote origin
cd ~/octopress/_deploy
git pull origin master
git push origin master
echo "done..
"
