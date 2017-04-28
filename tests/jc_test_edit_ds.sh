#!/bin/bash

PROXY="--noproxy 127.0.0.1"

CLIENT_CERT="/home/osboxes/jetconf/data/example-client.pem"

echo "--- conf-start 1"
POST_DATA='{ "jetconf:input": {"name": "Edit 1"} }'
URL="https://127.0.0.1:8443/restconf/operations/jetconf:conf-start"
curl $PROXY -v --http2 -k --cert-type PEM -E $CLIENT_CERT -X POST -d "$POST_DATA" "$URL" 

POST_DATA='{ "foo": [ {  "number": 6, "in-words": "six" },
        {"number":90, "in-words": "ninety" } ],
        "bar": false } '

echo "--- ADD newzone.cz"
URL="https://127.0.0.1:8443/restconf/data/example-2:bag"
#curl $PROXY -v --http2 -k --cert-type PEM -E $CLIENT_CERT -X POST -d "$POST_DATA" "$URL"
curl $PROXY -v --http2 -k --cert-type PEM -E $CLIENT_CERT -X PUT -d "$POST_DATA" "$URL"

echo "--- conf-commit"
URL="https://127.0.0.1:8443/restconf/operations/jetconf:conf-commit"
curl $PROXY -v --http2 -k --cert-type PEM -E $CLIENT_CERT -X POST "$URL" 
