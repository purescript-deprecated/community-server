#!/bin/bash

# This script creates a backup of the Pursuit data directory
# using Git.

set -e

pushd /var/pursuit/data/verified/

git status
git add .
git commit -m "Backup `date`"
git push origin master

popd
