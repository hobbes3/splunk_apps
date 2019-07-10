#!/bin/bash
AUTH=$1
# https://stackoverflow.com/a/246128/1150923
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

find "$DIR" -maxdepth 1 -name "*.tgz" -not -name "python-for-scientific-computing*" -exec splunk install app {} -update 1 -auth $AUTH \;

if [ "$(uname)" == "Darwin" ]; then
    find "$DIR" -maxdepth 1 -name "python-for-scientific-computing-for-mac*" -exec splunk install app {} -update 1 -auth $AUTH \;
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    find "$DIR" -maxdepth 1 -name "python-for-scientific-computing-for-linux*" -exec splunk install app {} -update 1 -auth $AUTH \;
fi
