#!/bin/bash
echo "
Now hooking up to Github pages"
cd ~
echo "repo name is:"
echo "git@github.com:edmondscommerce/edmondscommerce.github.io.git
"
rake setup_github_pages
rake generate
rake deploy
echo "done.."
