#!/bin/bash

echo "Updating Repo"

git pull -Xtheirs

echo "Now running rake command, please answer questions"

rake new_post
