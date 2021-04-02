#!/bin/ash
if [ -n "${PLUGINS}" ]; then
    yarn add -D ${PLUGINS}
fi
if [ -n "$USE_HOOK" ]; then
    
    /usr/local/bin/webhook -hooks /hooks.json -verbose

else
    sh /generate.sh
    while sleep 23h; do sh /generate.sh; done
fi