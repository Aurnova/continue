#!/bin/sh
# Write Continue config to ~/.continue only (CONTINUE_GLOBAL_DIR points here).
# This avoids git/settings sync overwriting the injected config in the workspace.
mkdir -p "${HOME}/.continue"
for repo in . "/workspaces/continue" "$(cd "$(dirname "$0")/.." 2>/dev/null && pwd)"; do
  [ -z "$repo" ] && continue
  src_json="${repo}/.continue/config.json"
  src_yaml="${repo}/.continue/config.yaml"
  if [ -f "$src_json" ] || [ -f "$src_yaml" ]; then
    # Copy and inject JSON to HOME only
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
    fi
    # Copy and inject YAML to HOME only (Continue prefers this)
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
content = content.replace('Authorization: \"Bearer \"', 'Authorization: \"Bearer ' + key_escaped + '\"')
with open(p, 'w') as f: f.write(content)
"
      fi
    fi
    # Copy to other possible home dirs so Continue finds config (vscode vs codespace user)
    for alt_home in /home/vscode /home/codespace; do
      [ "$alt_home" = "$HOME" ] && continue
      [ ! -d "$alt_home" ] && continue
      mkdir -p "$alt_home/.continue"
      [ -f "${HOME}/.continue/config.json" ] && cp -f "${HOME}/.continue/config.json" "$alt_home/.continue/"
      [ -f "${HOME}/.continue/config.yaml" ] && cp -f "${HOME}/.continue/config.yaml" "$alt_home/.continue/"
    done 2>/dev/null || true
    echo "Continue config written to ${HOME}/.continue (sync-safe)"
    exit 0
  fi
done
exit 0
