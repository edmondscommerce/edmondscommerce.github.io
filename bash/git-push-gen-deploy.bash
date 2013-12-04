#!/bin/bash
sshhistory
cd /opt/Projects/edmondscommerce.github.io/
git add -A
git commit -am 'commiting the source'
git pull origin source
git push origin source
cd _deploy
git pull origin master
git checkout origin/master .
git commit -am "Pulled remote master"
cd ../
bundle exec rake integrate
bundle exec rake gen_deploy
bundle exec rake notify
