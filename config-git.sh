#!/bin/bash

#git config --global user.email ""
#git config --global user.name ""

git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.st status
#git config --global alias.ann blame

git config --global core.autocrlf input

#Sometimes it is necessary to resolve the same conflicts multiple times. Git has the ability to record and replay conflict resolutions automatically, but - surprise surprise - it is not enabled by default. To fix it, run:
git config --global rerere.enabled true
#git config --global rerere.autoupdate true # this saves you the git add, but you should verify the result with git diff --staged

#git pull will show a nice diffstat, so you get an overview of the changes from upstream. git pull --rebase does not do that by default. But you want it:
git config --global rebase.stat true

#To get nicely colored patches (from git diff, git log -p, git show, etc.), use this:
#git config --global color.ui auto
#git config --global core.pager "less -FRSX"

git config --global --list

