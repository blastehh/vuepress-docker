#!/bin/ash
set -eo pipefail

if [ -n "$GITHUB_REPO" ]; then
    cd /root/src
    if [ -n "$GITHUB_TOKEN" ]; then
        rm -rf ..?* .[!.]* *
        git clone https://$GITHUB_TOKEN@$GITHUB_REPO .; git pull
    else
        git clone https://$GITHUB_REPO .; git pull
    fi

    vuepress build || (echo "Build failed. Aborting!"; exit 1)
    echo "Copying files..."
    rsync -q -r --delete .vuepress/dist/ /root/html/
    echo "Done!"
    if [ -n "$GITHUB_PUSH_REPO" ]; then
        if [ -n "$GITHUB_PUSH_TOKEN" ]; then
            PUSH_TOKEN=$GITHUB_PUSH_TOKEN
        else
            if [ -n "$GITHUB_TOKEN" ]; then
                echo "No tokens set for pushing."
                exit 1
            fi
            PUSH_TOKEN=$GITHUB_TOKEN
        fi
        echo "Pushing to Github..."
        cd .vuepress/dist
        git init
        git add -A
        git commit -m 'Auto Deploy'
        git remote set-url origin https://$PUSH_TOKEN@$GITHUB_PUSH_REPO
        git push -f origin
    fi
else
    sh /generate.sh
fi