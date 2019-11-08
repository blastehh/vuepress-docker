#!/bin/ash
set -euo pipefail

mkdir -p /root/html
cd /root/src
rm -rf .vuepress/dist
vuepress build
echo "Copying files..."
rsync -q -r --delete .vuepress/dist/ /root/html/
echo "Done!"