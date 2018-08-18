#!/bin/ash
set -euo pipefail

cd /root/src
rm -rf .vuepress/dist
vuepress build
echo "Copying files..."
rm -rf /root/html/*
cp -a .vuepress/dist/* /root/html/
echo "Done!"