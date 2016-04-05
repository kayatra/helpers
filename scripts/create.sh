#! /bin/bash

source $(dirname $0)/helpers.sh

# Create a new subproject
PROJECT_NAME=$1

if ! echo "${PROJECT_NAME}" | grep -E "^[a-zA0-Z0-9-]+$" > /dev/null; then
  echo "Invalid project name ${PROJECT_NAME}" >&2
  exit 1
fi

REPO_PATH="${BASE_ORG}/${PROJECT_NAME}"

if [ -d "${REPO_PATH}" ]; then
  echo "Project folder already exists"
else
  echo "Creating project folder"
  mkdir -p "${REPO_PATH}"
fi

if [ ! -d "${REPO_PATH}/.git" ]; then
  echo "Creating git repo"
  git --work-tree="${REPO_PATH}" --git-dir="${REPO_PATH}/.git" init
fi

echo "Creating base files"

for BASEFILE in $(echo ".gitignore .travis.yml LICENCE.txt"); do
  test ! -f "${REPO_PATH}/${BASEFILE}" && echo "- ${BASEFILE}" && cp "${BASE_PATH}/new-repo/${BASEFILE}" "${REPO_PATH}/${BASEFILE}"
done

! grep -E "^/${PROJECT_NAME}$" "${REPO_PATH}/.gitignore" > /dev/null && echo "/${PROJECT_NAME}" >> "${REPO_PATH}/.gitignore"


if [ ! -f "${REPO_PATH}/README.md" ]; then
  cat > "${REPO_PATH}/README.md" <<README
# Kayatra ${PROJECT_NAME}

[![Build Status](https://travis-ci.org/kayatra/${PROJECT_NAME}.svg?branch=master)](https://travis-ci.org/kayatra/${PROJECT_NAME})
[![GitHub license](https://img.shields.io/github/license/kayatra/${PROJECT_NAME}.svg)]()
README
fi
