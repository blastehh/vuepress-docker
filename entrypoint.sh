#!/bin/ash
if [ -n "$USE_HOOK" ]; then
    
    /usr/local/bin/webhook -hooks /hooks.json -verbose

else
    sh /generate.sh
    while sleep 23h; do sh /generate.sh; done
fi