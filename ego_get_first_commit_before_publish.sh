#!/bin/bash

org_branch=${1:-source}
html_branch=${2:-master}

git log --pretty="%H" --since "$(git log -n 1 --pretty="%cd" ${html_branch})" ${org_branch}|tail -1
