---
name: deep-research
description: Thorough, cited web research using built-in WebSearch and WebFetch. Decomposes a topic into sub-questions, deep-reads sources, and delivers a report with source attribution and labeled evidence boundaries. Covers comparisons, competitive analysis, investor/vendor diligence, and market sizing. Use when the user wants "research", a "deep dive", due diligence, a comparison or decision memo, TAM/SAM/SOM sizing, or any answer that must be backed by cited current sources. NOT for quick single-fact lookups (just use WebSearch directly) and NOT for searching the user's own connected enterprise platforms (use the enterprise-search plugin skills).
origin: ECC
---

# Deep Research

Produce thorough, cited research reports from multiple web sources using the built-in **WebSearch** and **WebFetch** tools. These are always available — no MCP configuration required.

## When to Activate

- User asks to research any topic in depth
- Competitive analysis, technology evaluation, or market sizing
- Due diligence on companies, investors, or technologies
- Comparison or decision memo built from current public evidence
- User says "research", "deep dive", "investigate", or "what's the current state of"

Do NOT use this skill for a quick single-fact lookup — one WebSearch call answers those. Do NOT use it to search the user's own connected platforms (email, Drive, Slack, etc.) — that is enterprise search, not web research.

## Step 0: Classify the Ask (Routing Preamble)

Before searching, decide what kind of research this is:

| Lane | Signal | Approach |
|------|--------|----------|
| Quick factual | Single answerable fact | Skip this skill; one WebSearch call |
| Deep research | Synthesis across many sources | Full workflow below |
| Decision memo / comparison | Outcome is a recommendation or ranking | Full workflow + a domain mode below |
| Local-context question | Answer is already in the repo, docs, or user-supplied material | Do not search the web for it |

Also: start from what the user already gave you. Normalize any supplied material into (a) already-evidenced facts, (b) needs verification, (c) open questions. Do not restart from zero if the user built part of the model.

## Workflow

### Step 1: Understand the Goal

Ask 1-2 quick clarifying questions:
- "What's your goal — learning, making a decision, or writing something?"
- "Any specific angle or depth you want?"

If the user says "just research it" — skip ahead with reasonable defaults.

### Step 2: Plan the Research

Break the topic into 3-5 research sub-questions. Example:
- Topic: "Impact of AI on healthcare"
  - What are the main AI applications in healthcare today?
  - What clinical outcomes have been measured?
  - What are the regulatory challenges?
  - What companies are leading this space?
  - What's the market size and growth trajectory?

If the ask matches one of the Domain Modes below, use its checklist to shape the sub-questions.

### Step 3: Execute Multi-Source Search

For EACH sub-question, run built-in WebSearch:

```
WebSearch(query: "<sub-question keywords>")
```

**Search strategy:**
- Use 2-3 different keyword variations per sub-question
- Mix general and news-focused queries; add a year (e.g. "2026") for freshness-sensitive topics
- Use operators like `site:`, quoted phrases, and `intitle:` to narrow results
- Aim for 15-30 unique sources total
- Prioritize: academic, official, reputable news > blogs > forums

### Step 4: Deep-Read Key Sources

For the most promising URLs, fetch full content with built-in WebFetch:

```
WebFetch(url: "<url>", prompt: "Extract facts relevant to <sub-question>, with any figures and dates")
```

Read 3-5 key sources in full per sub-question that matters. Do not rely only on search snippets — snippets miss caveats, dates, and context.

### Step 5: Synthesize and Write Report

Structure the report:

```markdown
# [Topic]: Research Report
*Generated: [date] | Sources: [N] | Confidence: [High/Medium/Low]*

## Executive Summary
[3-5 sentence overview of key findings]

## 1. [First Major Theme]
[Findings with inline citations]
- Key point ([Source Name](url))
- Supporting data ([Source Name](url))

## 2. [Second Major Theme]
...

## Key Takeaways
- [Actionable insight 1]
- [Actionable insight 2]

## Evidence Boundaries
- SOURCED: [claims backed by cited sources]
- USER-PROVIDED: [context supplied by the user, taken as given]
- INFERENCE: [what follows from the evidence but is not directly sourced]
- RECOMMENDATION: [the judgment call, and what it rests on]

## Risks and Caveats
[Contrarian evidence, downside cases, stale data flags]

## Sources
1. [Title](url) — [one-line summary]
2. ...

## Methodology
Searched [N] queries. Deep-read [M] sources.
Sub-questions investigated: [list]
```

For decision memos, order the body as: executive summary → key findings → implications → risks and caveats → recommendation → sources.

### Step 6: Deliver

- **Short topics**: Post the full report in chat
- **Long reports**: Post the executive summary + key takeaways, save the full report to a file

## Evidence Boundary Labeling

Every important claim in the report must carry one of four labels (inline or via the Evidence Boundaries section):

- **SOURCED** — backed by a cited source; include the citation
- **USER-PROVIDED** — from material the user supplied; not independently verified
- **INFERENCE** — follows from the evidence; label the leap
- **RECOMMENDATION** — a judgment call; state what it rests on

Never mix inference into sourced facts without labeling. Freshness-sensitive answers must include concrete dates.

## Parallel Research with Subagents

For broad topics, use the Task/Agent tool to parallelize:

```
Launch 3 research agents in parallel:
1. Agent 1: Research sub-questions 1-2
2. Agent 2: Research sub-questions 3-4
3. Agent 3: Research sub-question 5 + cross-cutting themes
```

Each agent uses WebSearch + WebFetch, reads sources, and returns findings with citations. The main session synthesizes into the final report.

## Domain Modes

When the research is business-facing, use the matching checklist to drive sub-questions.

### Investor / Fund Diligence
Collect:
- fund size, stage, and typical check size
- relevant portfolio companies
- public thesis and recent activity
- reasons the fund is or is not a fit
- any obvious red flags or mismatches

### Competitive Analysis
Collect:
- product reality, not marketing copy
- funding and investor history if public
- traction metrics if public
- distribution and pricing clues
- strengths, weaknesses, and positioning gaps

### Market Sizing (TAM/SAM/SOM)
Use:
- top-down estimates from reports or public datasets
- bottom-up sanity checks from realistic customer acquisition assumptions
- explicit assumptions for every leap in logic

### Technology / Vendor Research
Collect:
- how it works
- trade-offs and adoption signals
- integration complexity
- lock-in, security, compliance, and operational risk

## Quality Rules

1. **Every claim needs a source.** No unsourced assertions.
2. **Cross-reference.** If only one source says it, flag it as unverified.
3. **Recency matters.** Prefer sources from the last 12 months; call out stale data.
4. **Acknowledge gaps.** If you couldn't find good info on a sub-question, say so.
5. **No hallucination.** If you don't know, say "insufficient data found."
6. **Separate fact from inference.** Use the evidence-boundary labels above.
7. **Include contrarian evidence.** Downside cases and counterarguments belong in the report.

## Quality Gate (Before Delivering)

- [ ] All numbers are sourced or labeled as estimates
- [ ] Old data is flagged with dates
- [ ] The recommendation follows from the evidence
- [ ] Risks and counterarguments are included
- [ ] Important claims carry evidence-boundary labels
- [ ] The output makes a decision easier, not just longer

## Appendix: If Exa/Firecrawl MCP Is Connected

Built-in WebSearch/WebFetch are the default. If an Exa or firecrawl MCP server happens to be configured, its tools can substitute for higher-volume search and cleaner scraping:

**Exa** — check exact tool names before use; commonly `web_search_exa` and `get_code_context_exa`:

| Tool | Param | Default | Notes |
|------|-------|---------|-------|
| `web_search_exa` | `query` | required | Search query |
| | `numResults` | 8 | Number of results |
| | `type` | `auto` | Search mode |
| | `livecrawl` | `fallback` | Prefer live crawling when needed |
| | `category` | none | Optional focus such as `company` or `research paper` |
| `get_code_context_exa` | `query` | required | Code or API search query |
| | `tokensNum` | 5000 | Content tokens (1000-50000) |

Tips: use `category: "company"` for company intel; lower `tokensNum` (1000-2000) for focused snippets, higher (5000+) for comprehensive context.

**Firecrawl** — `firecrawl_search(query, limit)` for search, `firecrawl_scrape(url)` for full-page reads.

If neither MCP is connected (the default in this environment), do not mention them or attempt to call them — WebSearch and WebFetch cover the full workflow.

## Examples

```
"Research the current state of nuclear fusion energy"
"Deep dive into Rust vs Go for backend services in 2026"
"Compare payment providers for an Irish events company"
"Build a TAM/SAM/SOM estimate for AI code editors"
"Diligence this fund before I reply to their outreach"
```
