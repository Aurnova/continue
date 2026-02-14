# Continue configuration

This folder holds the Continue extension config used in the devcontainer and can be copied to `~/.continue` by the setup script. Continue prefers **config.yaml** (we provide both YAML and JSON).

## Model and API key

- **Model**: `qwen/qwen3-coder-next` (OpenRouter).
- **API key**: Set in `config.yaml` or `config.json` (setup script injects from `OPENROUTER_API_KEY` in Codespaces).

1. Get an API key from [OpenRouter](https://openrouter.ai/keys).
2. Open `.continue/config.json` and set `"apiKey": ""` to your key, e.g. `"apiKey": "sk-or-v1-..."`.

Keep API keys out of version control. You can:

- **Devcontainer**: Set `OPENROUTER_API_KEY` in the devcontainer (e.g. in `devcontainer.json` under `containerEnv`, or in GitHub Codespaces secrets). The setup script will inject it into the copied config so you never commit the key.
- **Local**: Edit `~/.continue/config.json` (or `.continue/config.json` in the repo) and set `apiKey` there.
