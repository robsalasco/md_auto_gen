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
if [[ $CHANGED_FILES =~ .*(README\.Rmd|data\.csv).* ]]
then
  R -e 'rmarkdown::render("README.Rmd", rmarkdown::md_document(variant = "markdown_github"))'
  R -e 'rmarkdown::render("README.Rmd", rmarkdown::html_document(), output_file="index.html")'

  git add README.md index.html
fi

git commit -m "Update by travis after $TRAVIS_COMMIT"
git push origin master
