#!/bin/ash
set -euo pipefail

if [ -n "$GITHUB_REPO" ]; then
    cd /root/src
    if [ -n "$GITHUB_TOKEN" ]; then
        rm -rf ..?* .[!.]* *
        git clone https://$GITHUB_TOKEN@$GITHUB_REPO .; git pull
    else
        git clone https://$GITHUB_REPO .; git pull
    fi

    vuepress build
    echo "Copying files..."
    rsync -q -r --delete .vuepress/dist/ /root/html/
    echo "Done!"
else
    sh /generate.sh
fi