#!/bin/bash
GH_REPO="@github.com/robsalasco/md_auto_gen.git"
FULL_REPO="https://$GH_TOKEN$GH_REPO"

mkdir out
cd out

git init
git remote add origin $FULL_REPO
git fetch
git config user.name "rapporter-travis"
git config user.email "travis"
git checkout master

CHANGED_FILES=`git show --stat $TRAVIS_COMMIT`
if [[ $CHANGED_FILES =~ .*README\.Rmd.* ]]
then
  R -e 'knitr::render_markdown("README.Rmd")'
  git add README.md
fi

git commit -m "Update by travis after $TRAVIS_COMMIT"
git push origin master
