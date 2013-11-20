#!/bin/bash
echo "
Grabbing rbenv Repo"
cd ~
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
source ~/.bashrc
echo "done.."

echo "
Installing Ruby 1.9.3"
rbenv install 1.9.3-p0
rbenv global 1.9.3-p0
rbenv rehash
echo "done.."

echo "
check Ruby version here:"
ruby --version


echo "
Now install Octopress"
cd ~
git clone git://github.com/imathis/octopress.git octopress
cd octopress
gem install bundler
rbenv rehash    # If you use rbenv, rehash to be able to run the bundle command
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
echo "done.."
