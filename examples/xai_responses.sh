#!/bin/sh
# Grok (xAI) calling Prax through the Responses API's hosted MCP tool.  XAI_API_KEY and PRAX_API_KEY in the environment.
curl -s https://api.x.ai/v1/responses \
  -H "Authorization: Bearer $XAI_API_KEY" -H "Content-Type: application/json" \
  -d "{
    \"model\": \"grok-4\",
    \"tools\": [{\"type\": \"mcp\", \"server_label\": \"prax\", \"server_url\": \"https://mcp.orabrain.com/mcp\",
                \"authorization\": \"$PRAX_API_KEY\",
                \"allowed_tools\": [\"screen_bank\", \"screen_entity\", \"screen_wallet\", \"screen_transfer\"]}],
    \"input\": \"We are about to wire EUR 48,000 to Acme GmbH at BIC DEUTDEFF. Can it go out? Verdict, reasons, references.\"
  }"
