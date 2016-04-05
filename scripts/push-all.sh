#! /bin/bash -e

source $(dirname $0)/helpers.sh

# Do git push on all subprojects

IFS=$'\n'
for PROJECT in $(find "${GOPATH}/src/github.com/kayatra/" -type d -maxdepth 1 ! -path "*/kayatra/"); do
  if [ $(git --git-dir="${PROJECT}/.git" --work-tree="${PROJECT}" rev-parse --abbrev-ref HEAD) == "master" ]; then
    git --git-dir="${PROJECT}/.git" --work-tree="${PROJECT}" push --set-upstream origin master
  else
    echo "Skipping ${PROJECT}, not on master" >&2
  fi
done
