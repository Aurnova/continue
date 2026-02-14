#!/bin/sh
# Uninstall Copilot so the codespace uses Continue only.
# Tries both 'code' (VS Code/Codespaces) and 'cursor' CLIs.
for cmd in code cursor; do
  if command -v "$cmd" >/dev/null 2>&1; then
    "$cmd" --uninstall-extension GitHub.copilot --force 2>/dev/null || true
    "$cmd" --uninstall-extension GitHub.copilot-chat --force 2>/dev/null || true
  fi
done
