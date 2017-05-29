#!/bin/bash

PROXY="--noproxy 127.0.0.1"

CLIENT_CERT="/home/osboxes/jetconf/data/example-client.pem"

echo "--- conf-start 1"
POST_DATA='{ "jetconf:input": {"name": "Edit 1"} }'
URL="https://127.0.0.1:8443/restconf/operations/jetconf:conf-start"
curl $PROXY -v --http2 -k --cert-type PEM -E $CLIENT_CERT -X POST -d "$POST_DATA" "$URL" 

POST_DATA=' {
        "interface": [
        {
          "name": "eth0",
          "type": "ethernetCsmacd",
          "enabled": true,
          "ieee802-dot1q-bridge:bridge-port": 
          {
                  "ieee802-dot1q-sched:gate-parameters":
                  {
                          "admin-base-time": 
                          {
                                  "fractional-seconds": 0,
                                  "seconds": 0
                          },
                          "admin-cycle-time":
                          {
                                  "denominator": 1000500,
                                  "numerator": 500
                          },
                          "config-change": true,
                          "admin-control-list-length": 2,
                          "admin-control-list": [
                          {
                                  "index": 0,
                                  "sgs-params":
                                  {
                                          "gate-states-value": 16,
                                          "time-interval-value": 12470
                                  }
                          },
                          {
                                  "index": 1,
                                  "sgs-params":
                                  {
                                          "gate-states-value": 239,
                                          "time-interval-value": 13245
                                  }
                          },
                          {
                                  "index": 2,
                                  "sgs-params":
                                  {
                                          "gate-states-value": 255,
                                          "time-interval-value": 13045
                                  }
                          }
                          ]
                  }
          }
        }
        ]
}'

echo "--- ADD newzone.cz"
URL="https://127.0.0.1:8443/restconf/data/ietf-interfaces:interfaces"
#curl $PROXY -v --http2 -k --cert-type PEM -E $CLIENT_CERT -X POST -d "$POST_DATA" "$URL"
curl $PROXY -v --http2 -k --cert-type PEM -E $CLIENT_CERT -X PUT -d "$POST_DATA" "$URL"

echo "--- conf-commit"
URL="https://127.0.0.1:8443/restconf/operations/jetconf:conf-commit"
curl $PROXY -v --http2 -k --cert-type PEM -E $CLIENT_CERT -X POST "$URL" 
