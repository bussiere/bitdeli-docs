#!/bin/bash
set -e

getgit()
{
    if [[ -e repos/$1 ]]; then
        echo "Updating $1"
        (cd repos/$1; git pull)
    else
        (cd repos; git clone git://github.com/bitdeli/$1)
    fi
}

mkdir -p repos
getgit "bitdeli-py"
getgit "profile-mixpanel-hourly"
getgit "profile-toy-data"
getgit "profile-github-commits"
getgit "profile-events-raw"

sphinx-build src html
