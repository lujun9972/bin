#!/usr/bin/env bash

function get_url_of()
{
    branch=${1:-origin}
    git remote get-url ${branch}
}

function get_speed_url_of()
{
    branch=${1:-origin}
    get_url_of ${branch}|sed 's/^git@github.com/git@git.zhlh6.cn/'
}

function set_speed_url_to()
{
    branch="${1:-origin}"
    speed_url=$(get_speed_url_of ${branch})
    git remote set-url "${branch}" ${speed_url}
}
set_speed_url_to $1
