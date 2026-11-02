"""Screen a wallet through REST with a portal key."""
import os, requests
r = requests.get("https://mcp.orabrain.com/v1/address/eth/0x5227f603C1eE34CE3C06eFe6477003BDfCCB2f8c",
                 headers={"Authorization": "Bearer " + os.environ["PRAX_KEY"]}, timeout=20)
d = r.json()
print(d.get("risk_band"), "|", d.get("story", "")[:200])
