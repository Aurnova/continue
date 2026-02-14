# Continue configuration

**In the repo:** This folder (`.continue/`) is the **template only**. `config.json` and `config.yaml` have empty `apiKey` on purpose—we never commit keys.

**In the codespace:** Continue reads from **`~/.continue`** (e.g. `/home/codespace/.continue`). The setup script copies these files there and injects your `OPENROUTER_API_KEY` from Codespaces secrets. So the key exists only in `~/.continue/config.json` and `~/.continue/config.yaml`, not in the workspace `.continue/` folder.

- **Model**: `qwen/qwen3-coder-next` (OpenRouter), via provider `openai` + `apiBase: https://openrouter.ai/api/v1`.
- **API key**: Set `OPENROUTER_API_KEY` in GitHub → Settings → Codespaces → Secrets. Then in the codespace run `bash .devcontainer/setup-continue-config.sh` (and rebuild if needed). To confirm the key is present: `grep -q apiKey ~/.continue/config.json && echo "Key is set"` (does not print the key).

**Local (no Codespaces):** Edit `~/.continue/config.json` or `config.yaml` and set `apiKey` there.
