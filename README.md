# Prax Data Services — MCP server

![Prax Data Services](https://mcp.orabrain.com/portal/badge.svg)
[![MCP Registry](https://img.shields.io/badge/MCP%20Registry-com.orabrain%2Fprax--data--services-0f766e)](https://registry.modelcontextprotocol.io/v0.1/servers?search=com.orabrain)

Security and compliance intelligence for financial services, as tools your AI agents can call, on
both rails: counterparty-bank and wire screening (BIC / IBAN / ABA / LEI, jurisdiction lists, FinCEN 311,
enforcement history), sanctions screening of people, companies, vessels and crypto addresses, regulatory
enforcement history, licence and MSB registration checks, wallet / smart-contract risk screening (KYT / AML),
pre-signature transfer screening, transaction analysis and a threat-intelligence alert feed. Verdicts come with reasons and references — no black-box score.

**Endpoint:** `https://mcp.orabrain.com/mcp` (Streamable HTTP, OAuth 2.1 — no key to paste)
**Docs & plans:** https://mcp.orabrain.com · **Free plan:** 10 credits/day, no card.

## Connect

| Client | How |
|---|---|
| **Claude** (claude.ai / desktop) | Settings → Connectors → Add custom connector → URL `https://mcp.orabrain.com/mcp` → Connect (sign in on the portal, approve) |
| **Claude Code** | `claude mcp add --transport http prax https://mcp.orabrain.com/mcp` then `/mcp` → prax → Authenticate |
| **Cursor** | [![Add to Cursor](https://cursor.com/deeplink/mcp-install-dark.svg)](https://cursor.com/install-mcp?name=prax&config=eyJ1cmwiOiAiaHR0cHM6Ly9tY3Aub3JhYnJhaW4uY29tL21jcCJ9) then sign in when prompted. For always-on screening add the rules file: `mkdir -p .cursor/rules && curl -sS -o .cursor/rules/prax-screening.mdc https://mcp.orabrain.com/portal/cursor/prax-screening.mdc`, or install the **Prax Screening** plugin ([Prax-Labs-com/cursor-plugins](https://github.com/Prax-Labs-com/cursor-plugins)) from Cursor Settings → Plugins |
| **VS Code** (Copilot agent mode) | `.vscode/mcp.json`: `{"servers":{"prax":{"type":"http","url":"https://mcp.orabrain.com/mcp"}}}` |
| **ChatGPT** (Plus/Pro/Business) | Settings → Apps & Connectors → Advanced → Developer mode, then Create → MCP server URL above, authentication OAuth |
| **Gemini** (app) | Settings → Connected apps → Custom apps → Add a custom app → server URL above → approve in the browser. Gemini Enterprise: Connected apps → Add MCP Server |
| **Grok** (paid plans) | [grok.com/connectors](https://grok.com/connectors) → New Connector → Custom → server URL above → sign in. xAI Responses API: `{"type":"mcp","server_label":"prax","server_url":"https://mcp.orabrain.com/mcp","authorization":"prax_live_…"}` |
| **Anything else** | Any MCP client with Streamable HTTP + OAuth (dynamic client registration supported), or send `Authorization: Bearer prax_live_…` with a key from the [portal](https://mcp.orabrain.com/portal/) |

The first call sends you to `mcp.orabrain.com/portal` to sign in (or create a free account) and approve the app.
Connected apps are listed under **Account → Connected apps**, each with its own key; disconnect any time.

## Tools

| Tool | What it answers | Plan |
|---|---|---|
| `screen_wallet` | Is this EVM address safe? Sanctions, exploits, phishing, scams, drainers, mixers, malicious contracts, first-hop exposure. Risk band, labels, roles, alerts, counterparties, plain-language story. | Free |
| `screen_bank` | Bank / wire screening: BIC, IBAN, ABA routing number or LEI (+ bank name, beneficiary). Checksums, legal entity (GLEIF), FATF and EU lists, FinCEN 311, sanctions, enforcement. allow / review / block with reasons. | Free |
| `screen_entity` | Sanctions and export-control screening of a person, company, vessel or address: OFAC, UK, EU, UN, SECO plus the US Consolidated Screening List (BIS Entity, Denied Persons, Unverified, MEU; State nonproliferation and ITAR debarred; OFAC SSI, FSE, CAPTA, MBS, CMIC). Fuzzy names, aliases, linked addresses. | Free |
| `screen_enforcement` | Enforcement actions naming a firm or person: Fed, OCC, FDIC, FinCEN, SEC, CFTC, UK FCA; authority, date, type, link. | Builder |
| `screen_licence` | Registered / licensed and where: FinCEN MSB, NY DFS virtual currency, EU MiCA register (authorised CASPs and non-compliant entities), Dubai VARA, Hong Kong SFC, UK FCA register (live), LEI. | Builder |
| `screen_country` | Country / jurisdiction risk: FATF call for action and increased monitoring, EU high-risk, FinCEN 311, OFAC comprehensive programmes, export-control footprint. high / elevated / standard with reasons. | Free |
| `screen_company` | Does the counterparty exist, who runs it, is it active: GLEIF (LEI, parents, subsidiaries), UK Companies House (officers, PSCs, charges, insolvency; free key), US SEC EDGAR (CIK, SIC, filings) plus sanctions / export-control and enforcement screening. | Builder |
| `screen_adverse_media` | Negative news naming a person or company with a financial-crime theme (GDELT, 15-minute updates): titles, dates, sources, links. | Business |
| `screen_domain` | Domain, URL or e-mail domain: malware and hijacked-netblock lists, disposable e-mail domains, domain age (RDAP), MX / SPF / DMARC, hosting country. | Builder |
| `screen_ip` | Botnet C2, hijacked netblocks, active-threat and Tor exit lists, RDAP allocation, country lists. | Builder |
| `screen_securities` | ISIN / CUSIP / SEDOL / ticker via OpenFIGI; issuer against OFAC NS-CMIC and sectoral sanctions, sanctions lists, SEC trading suspensions, enforcement. | Builder |
| `screen_cve` | Vulnerability check: OSV advisories (severity, affected packages, fixed versions), CISA KEV (exploited in the wild), EPSS. exploited / known / unknown. | Free |
| `screen_package` / `screen_packages` | Known vulnerabilities in a package at a version (PyPI, npm, Go, Maven, crates.io, NuGet, RubyGems, Packagist, Linux distros), with KEV, EPSS and fixed versions; batch of 50 for an SBOM. | Builder |
| `screen_transfer` | Pre-signature check: allow / review / block for *amount* of *asset* from A to B, with reasons. No chain call. | Builder |
| `analyze_transaction` | Status, value, counterparties and risk of both sides for a tx hash. | Builder |
| `screen_wallets_batch` / `screen_transfers_batch` | Up to 50 per call — portfolio sweeps, payout files. | Builder |
| `search` / `fetch` | Explore Prax intel in plain words; fetch a full record. | Business |
| `get_alerts` | Approved threat-intel alerts from the last 24 h (same payload as the webhook feed). | Business |

Try: *"Can we wire to BIC DEUTDEFF for Acme GmbH?"* · *"Any enforcement actions against Acme Bancorp?"* · *"Is Acme Payments a registered MSB?"* ·
*"Is 0x5227f603C1eE34CE3C06eFe6477003BDfCCB2f8c safe to pay?"* · *"Screen Acme Trading Ltd against sanctions"* ·
*"Any new exploit alerts today?"*

## REST

Same backend, same metering: `https://mcp.orabrain.com/v1` — OpenAPI at `/v1/openapi.json`. Banking tools are `POST /v1/screen_bank`, `/v1/screen_enforcement`, `/v1/screen_licence`, `/v1/screen_country`, `/v1/screen_company`, `/v1/screen_adverse_media`, `/v1/screen_domain`, `/v1/screen_ip`, `/v1/screen_securities`, `/v1/screen_cve`, `/v1/screen_package`, `/v1/screen_packages` with a JSON body. See `examples/`.

## Terms

Output is licensed for use inside your own product only — no resale, redistribution, model training or competing
services. [Terms of Service](https://mcp.orabrain.com/portal/terms) · [Privacy](https://mcp.orabrain.com/portal/privacy)

## Registry

Published to the official MCP Registry as `com.orabrain/prax-data-services` (see `server.json`).
