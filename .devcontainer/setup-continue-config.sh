#!/bin/sh
# Copy baked-in Continue config to ~/.continue and to workspace .continue.
# Continue prefers config.yaml over config.json; we write both so the extension finds models.
mkdir -p "${HOME}/.continue"
# Try multiple possible repo locations (Codespaces uses /workspaces/REPO_NAME)
for repo in . "/workspaces/continue" "$(cd "$(dirname "$0")/.." 2>/dev/null && pwd)"; do
  [ -z "$repo" ] && continue
  src_json="${repo}/.continue/config.json"
  src_yaml="${repo}/.continue/config.yaml"
  if [ -f "$src_json" ] || [ -f "$src_yaml" ]; then
    ws_continue="$(cd "$repo" 2>/dev/null && pwd)/.continue"
    [ -n "$ws_continue" ] || ws_continue="${repo}/.continue"
    mkdir -p "$ws_continue"

    # Copy and inject JSON
    if [ -f "$src_json" ]; then
      cp -f "$src_json" "${HOME}/.continue/config.json"
      if [ -n "${OPENROUTER_API_KEY:-}" ]; then
        python3 -c "
import json, os
p = os.path.join(os.environ['HOME'], '.continue', 'config.json')
with open(p) as f: c = json.load(f)
key = os.environ.get('OPENROUTER_API_KEY', '')
if c.get('models'):
    for m in c['models']:
        if m.get('apiKey') == '': m['apiKey'] = key
if c.get('tabAutocompleteModel') and c['tabAutocompleteModel'].get('apiKey') == '':
    c['tabAutocompleteModel']['apiKey'] = key
with open(p, 'w') as f: json.dump(c, f, indent=2)
"
      fi
      cp -f "${HOME}/.continue/config.json" "$ws_continue/config.json"
    fi

    # Copy and inject YAML (Continue prefers this when present)
    if [ -f "$src_yaml" ]; then
      cp -f "$src_yaml" "${HOME}/.continue/config.yaml"
      if [ -n "${OPENROUTER_API_KEY:-}" ]; then
        python3 -c "
import os
key = os.environ.get('OPENROUTER_API_KEY', '')
key_escaped = key.replace('\\\\', '\\\\\\\\').replace('\"', '\\\\\"')
p = os.path.join(os.environ['HOME'], '.continue', 'config.yaml')
with open(p) as f: content = f.read()
content = content.replace('apiKey: \"\"', 'apiKey: \"' + key_escaped + '\"')
with open(p, 'w') as f: f.write(content)
"
      fi
      cp -f "${HOME}/.continue/config.yaml" "$ws_continue/config.yaml"
    fi

    echo "Continue config copied to ${HOME}/.continue and $ws_continue"
    exit 0
  fi
done
exit 0
