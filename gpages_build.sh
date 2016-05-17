#!/bin/bash
# Fork of https://github.com/Polymer/tools/blob/master/bin/gp.sh
# Modified to work with Travis CI automated builds
# Check http://zisismaras.me/polymer/2015/12/02/automatic-github-pages-for-polymer-elements-with-travis-ci.html
#
# Original license follows
#
# @license
# Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
# This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
# The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
# The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
# Code distributed by Google as part of the polymer project is also
# subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
#

# This script pushes a demo-friendly version of your element and its
# dependencies to gh-pages.

# usage gp Polymer core-item [branch]
# Run in a clean directory passing in a GitHub org and repo name
org=$1
repo=$2
name=$3
email=$4
branch=${5:-"master"} # default to master when branch isn't specified

rm -rf temp
mkdir temp && cd temp

# make folder (same as input, no checking!)
rm -rf $repo
mkdir $repo
git clone git@github.com:$org/$repo.git --single-branch

# switch to gh-pages branch
pushd $repo >/dev/null
git checkout --orphan gh-pages

# remove all content
git rm -rf -q .

# use bower to install runtime deployment
bower cache clean $repo # ensure we're getting the latest from the desired branch.
git show ${branch}:bower.json > bower.json
echo "{
  \"directory\": \"components\"
}
" > .bowerrc
bower install
bower install platform.js PolymerElements/paper-input PolymerElements/paper-checkbox
bower install $org/$repo#$branch
git checkout ${branch} -- demo
rm -rf components/$repo/demo
mv demo components/$repo/

# redirect by default to the component folder
echo "<META http-equiv="refresh" content=\"0;URL=components/$repo/\">" >index.html

git config user.name $name
git config user.email $email

# send it all to github
git add -A .
git commit -am 'Deploy to GitHub Pages'
git push --force --quiet -u origin gh-pages > /dev/null 2>&1

popd >/dev/null
