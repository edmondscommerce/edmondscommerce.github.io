#!/bin/bash
set -e;
PATHTOLATEST=`ls -t source/_posts | head -1`;
echo $PATHTOLATEST
vim source/_posts/$PATHTOLATEST
