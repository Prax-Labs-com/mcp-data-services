# Prax Data Services — MCP server

![Prax Data Services](https://mcp.orabrain.com/portal/badge.svg)
[![MCP Registry](https://img.shields.io/badge/MCP%20Registry-com.orabrain%2Fprax--data--services-0f766e)](https://registry.modelcontextprotocol.io/v0.1/servers?search=com.orabrain)

Security and compliance intelligence for financial services, as tools your AI agents can call:
wallet / smart-contract risk screening (KYT / AML), pre-signature transfer screening, sanctions
screening of people, companies, vessels and crypto addresses, transaction analysis and a
threat-intelligence alert feed. Verdicts come with reasons and references — no black-box score.

**Endpoint:** `https://mcp.orabrain.com/mcp` (Streamable HTTP, OAuth 2.1 — no key to paste)
**Docs & plans:** https://mcp.orabrain.com · **Free plan:** 10 credits/day, no card.

## Connect

| Client | How |
|---|---|
| **Claude** (claude.ai / desktop) | Settings → Connectors → Add custom connector → URL `https://mcp.orabrain.com/mcp` → Connect (sign in on the portal, approve) |
| **Claude Code** | `claude mcp add --transport http prax https://mcp.orabrain.com/mcp` then `/mcp` → prax → Authenticate |
| **Cursor** | [Add to Cursor](cursor://anysphere.cursor-deeplink/mcp/install?name=prax&config=eyJ1cmwiOiAiaHR0cHM6Ly9tY3Aub3JhYnJhaW4uY29tL21jcCJ9) or add to `.cursor/mcp.json`: `{"mcpServers":{"prax":{"url":"https://mcp.orabrain.com/mcp"}}}` |
| **VS Code** (Copilot agent mode) | `.vscode/mcp.json`: `{"servers":{"prax":{"type":"http","url":"https://mcp.orabrain.com/mcp"}}}` |
| **ChatGPT** | Settings → Connectors → Create (Developer mode) → MCP server URL above, authentication OAuth |
| **Anything else** | Any MCP client with Streamable HTTP + OAuth (dynamic client registration supported), or send `Authorization: Bearer prax_live_…` with a key from the [portal](https://mcp.orabrain.com/portal/) |

The first call sends you to `mcp.orabrain.com/portal` to sign in (or create a free account) and approve the app.
Connected apps are listed under **Account → Connected apps**, each with its own key; disconnect any time.

## Tools

| Tool | What it answers | Plan |
|---|---|---|
| `screen_wallet` | Is this EVM address safe? Sanctions, exploits, phishing, scams, drainers, mixers, malicious contracts, first-hop exposure. Risk band, labels, roles, alerts, counterparties, plain-language story. | Free |
| `screen_entity` | Sanctions screening of a person, company, vessel or address (fuzzy names, aliases, linked addresses). | Free |
| `screen_transfer` | Pre-signature check: allow / review / block for *amount* of *asset* from A to B, with reasons. No chain call. | Builder |
| `analyze_transaction` | Status, value, counterparties and risk of both sides for a tx hash. | Builder |
| `screen_wallets_batch` / `screen_transfers_batch` | Up to 50 per call — portfolio sweeps, payout files. | Builder |
| `search` / `fetch` | Explore Prax intel in plain words; fetch a full record. | Business |
| `get_alerts` | Approved threat-intel alerts from the last 24 h (same payload as the webhook feed). | Business |

Try: *"Is 0x5227f603C1eE34CE3C06eFe6477003BDfCCB2f8c safe to pay?"* · *"Screen Acme Trading Ltd against sanctions"* ·
*"Any new exploit alerts today?"*

## REST

Same backend, same metering: `https://mcp.orabrain.com/v1` — OpenAPI at `/v1/openapi.json`. See `examples/`.

## Terms

Output is licensed for use inside your own product only — no resale, redistribution, model training or competing
services. [Terms of Service](https://mcp.orabrain.com/portal/terms) · [Privacy](https://mcp.orabrain.com/portal/privacy)

## Registry

Published to the official MCP Registry as `com.orabrain/prax-data-services` (see `server.json`).
