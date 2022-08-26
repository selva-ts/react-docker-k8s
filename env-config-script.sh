#!/bin/sh
# line endings must be \n, not \r\n !
echo "window._env_ = {" > ./usr/share/nginx/html/env-config.js
awk -F '=' '{ print $1 ": \"" (ENVIRON[$1] ? ENVIRON[$1] : $2) "\"," }' ./usr/share/nginx/html/env-config-template >> ./usr/share/nginx/html/env-config.js
echo "}" >> ./usr/share/nginx/html/env-config.js