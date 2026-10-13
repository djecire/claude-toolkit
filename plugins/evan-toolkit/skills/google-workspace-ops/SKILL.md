---
name: google-workspace-ops
description: Find, read, summarize, organize, and create Google Drive files through the connected Google Drive MCP (search, read, download, create, copy, metadata, permissions, recents). Use when the user needs to locate, audit, summarize, or produce Drive assets. NOT for in-place editing of Google Docs, Sheets, or Slides — no Docs/Sheets/Slides editing surface is connected; edits must go through create_file/copy_file replacements or be flagged as not possible.
origin: ECC
---

# Google Workspace Ops

Operate Google Drive assets as working systems using the connected Drive MCP tools only.

## Available Tool Surface (verified)

The connected Google Drive MCP exposes exactly these tools (load via ToolSearch if deferred):

- `search_files` — find files by query
- `read_file_content` — read a file's content (Docs export as text)
- `download_file_content` — pull file bytes locally
- `create_file` — create a new file in Drive
- `copy_file` — duplicate an existing file
- `get_file_metadata` — owner, modified time, mime type, parents
- `get_file_permissions` — who can see/edit
- `list_recent_files` — recently modified files

**There is NO connected editing surface for Docs, Sheets, or Slides.** You cannot modify a document, spreadsheet range, or slide in place. When the user asks for an in-place edit:

1. Say plainly that in-place editing is not available with the connected tools.
2. Offer the workable routes:
   - `read_file_content` → produce the revised content → `create_file` as a new file (user replaces or links it), or
   - `copy_file` to preserve the original, then deliver revised content as a new file or local file for the user to paste in, or
   - `download_file_content` → edit locally → hand the file back to the user to re-upload.
3. Never pretend an edit was applied to the original file.

## When to Use

- Find a doc, sheet, or deck and report or summarize its current state
- Consolidate plans, trackers, notes, or customer lists stored in Drive
- Detect duplicates and stale versions of a tracker or deck
- Produce a new or replacement Drive file from existing content
- Audit who has access to a file

## Workflow

### 1. Find the asset
- `search_files` with the best title/keyword query; broaden if zero hits
- `list_recent_files` when the user says "the doc I was just working on"
- Disambiguate candidates with `get_file_metadata` (owner, modified time, parent folder) — never guess from filename alone

### 2. Inspect before acting
- `read_file_content` to summarize structure (headings, tabs described in content, sections)
- `get_file_metadata` for freshness; `get_file_permissions` if sharing matters
- Decide: is this a read/summarize task (fully supported) or an edit task (route per the rules above)?

### 3. Act with the real tools
- Summaries and audits: read → report, no writes
- New content: `create_file`
- Safe restructuring: `copy_file` first, then `create_file` the revised version
- Local processing (e.g. spreadsheet analysis): `download_file_content` → process locally with Bash → return results or a new file
- In-place edit requests: follow the "no editing surface" routing — do not fake it

### 4. Keep the working system clean
When the file is part of a larger workflow, also surface via `search_files` + `get_file_metadata`:
- duplicate trackers (same title stem, different modified times)
- stale decks vs the canonical version
- whether an asset should be archived, merged, or renamed (recommend; the user executes renames/moves — no move/rename tool is connected)

## Output Format

```text
ASSET
- file name
- type (mime)
- why this is the right file (metadata evidence)

CURRENT STATE
- structure summary
- key problems or blockers
- freshness / duplicates found

ACTION
- what was done with which tool (create_file / copy_file / read-only)
- OR what is not possible in-place and the offered route

FOLLOW-UPS
- archive / merge / duplicate cleanup / next file to update
```

## Good Use Cases

- "Find the active planning doc and condense it" → search_files, read_file_content, deliver summary or create_file a condensed version
- "Show me the churn-risk rows in this customer sheet" → download_file_content, analyze locally, report
- "Find the current tracker, not the stale duplicate" → search_files + get_file_metadata comparison
- "Who can see the pricing doc?" → get_file_permissions
