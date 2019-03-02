#!/bin/ash
set -euo pipefail

cd /root/src
rm -rf .vuepress/dist
if [ -n "$USE_GITHUB" ]; then
    if [ -z "$GITHUB_REPO" ]; then
        exit 1
    fi
    
    if [ -n "$GITHUB_TOKEN" ]; then
        git clone https://$GITHUB_TOKEN@$GITHUB_REPO .; git pull
    else
        git clone https://$GITHUB_REPO .; git pull
    fi

fi

vuepress build
echo "Copying files..."
rsync -q -r --delete .vuepress/dist/ /root/html/
echo "Done!"