#!/bin/bash

KONG_URL=127.0.0.1
KONG_ADMIN_PORT=8001
KONG_PROXY_PORT=8000
KONG_ADMIN_TOKEN=password

http post ${KONG_URL}:${KONG_ADMIN_PORT}/workspaces name=test kong-admin-token:password

http post ${KONG_URL}:${KONG_ADMIN_PORT}/test/services name=jokeService url=http://dadjokes.online kong-admin-token:password

http post ${KONG_URL}:${KONG_ADMIN_PORT}/test/services/jokeService/routes name=jokeRoute paths:='["/joke"]' kong-admin-token:password


http get ${KONG_URL}:${KONG_PROXY_PORT}/joke | jq ".Joke"
