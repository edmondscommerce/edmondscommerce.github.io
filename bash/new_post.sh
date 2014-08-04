#!/bin/bash

echo "Updating Repo"

git pull -Xtheirs

echo "Now running rake command, please answer questions"

bundle exec rake new_post
