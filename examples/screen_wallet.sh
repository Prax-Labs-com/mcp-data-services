#!/bin/bash
# Screen a wallet with a portal key (REST). Create a key at https://mcp.orabrain.com/portal/keys
KEY=${PRAX_KEY:?set PRAX_KEY=prax_live_...}
curl -s -H "Authorization: Bearer $KEY" "https://mcp.orabrain.com/v1/address/eth/0x5227f603C1eE34CE3C06eFe6477003BDfCCB2f8c" | python3 -m json.tool
