#!/bin/bash

PATHTOLATEST=`ls -t source/_posts | head -1`;
echo $PATHTOLATEST
bundle exec rake isolate[$PATHTOLATEST];
bundle exec rake generate;
bundle exec rake preview;
