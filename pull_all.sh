#! /usr/bin/sh
# Old one-liner
#ls | xargs -I{} git -C {} pull
prefix="./"
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

for path in $(find . -maxdepth 1 ! -path . -type d); do
    path=${path#$prefix}
    if [ -d $path/.git/ ]; then
        echo "$GREEN[$path]$NC"
        git -C $path pull
    else
        echo "$RED[$path]$NC is not a .git repo"
    fi
done