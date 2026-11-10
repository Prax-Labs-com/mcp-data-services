#!/bin/bash
# No key needed to list the tools (initialize / tools/list are public).
curl -s -X POST https://mcp.orabrain.com/mcp -H 'Content-Type: application/json' -H 'Accept: application/json, text/event-stream' \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' | python3 -c 'import json,sys;[print(t["name"],"-",t["title"]) for t in json.load(sys.stdin)["result"]["tools"]]'
