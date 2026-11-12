#!/bin/bash
# Bank / wire screening over REST. KEY = a key from https://mcp.orabrain.com/portal/keys (free plan works).
curl -s -X POST https://mcp.orabrain.com/v1/screen_bank \
  -H "Authorization: Bearer ${KEY:-prax_live_YOUR_KEY}" -H "Content-Type: application/json" \
  -d '{"identifier": "DEUTDEFF", "beneficiary_name": "Acme GmbH"}' | python3 -m json.tool
# Enforcement history and licence check (Builder plan):
#   -d '{"name": "Acme Bancorp", "years": 5}'      https://mcp.orabrain.com/v1/screen_enforcement
#   -d '{"name": "Acme Payments LLC", "jurisdiction": "US"}'   https://mcp.orabrain.com/v1/screen_licence
