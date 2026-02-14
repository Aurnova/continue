# Continue + OpenRouter (Qwen3 Coder Next)

Open in Codespaces and chat with **Qwen3 Coder Next** via OpenRouter. Continue is preconfigured; Copilot is disabled.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/Aurnova/continue?quickstart=1)

---

## 1. Open in Codespace

Use the **Open in GitHub Codespaces** link above, or **Code** → **Codespaces** → **Create codespace on main**.

## 2. Set up Continue (one-time)

Continue needs your OpenRouter API key so it can use the model. **No key = “Models Add-On” / setup prompts.**

1. Get a key: [openrouter.ai/keys](https://openrouter.ai/keys)
2. In GitHub: **Settings** → **Codespaces** → **Secrets** (see [Codespaces secrets](https://docs.github.com/en/codespaces/managing-your-codespaces/managing-encrypted-secrets-for-your-codespaces)). Add:
   - **Name:** `OPENROUTER_API_KEY`
   - **Value:** your key (e.g. `sk-or-v1-...`)
3. In the codespace: **Command Palette** (`Ctrl+Shift+P` / `Cmd+Shift+P`) → **Codespaces: Rebuild Container**. After the rebuild, run **Developer: Reload Window**. Continue will then see the key and the model.

   **Still seeing "Models Add-On"?** In the terminal, from the workspace root run:
`cd /workspaces/continue && bash .devcontainer/setup-continue-config.sh`
(If your workspace path is different, `cd` to the folder that contains `.devcontainer` first.) Then **Developer: Reload Window**.

**If Copilot still appears:** Rebuild again; the devcontainer also runs a script to uninstall Copilot (works for both VS Code and Cursor).

## 3. Chat

Click **Continue** in the sidebar or press **`Ctrl+L`** / **`Cmd+L`**. Chat and autocomplete use **Qwen3 Coder Next**—no sign-in or model picker once the key is set.

---

**Local VS Code:** Clone, install [Continue](https://marketplace.visualstudio.com/items?itemName=Continue.continue), and set your OpenRouter key in `.continue/config.json` (see `.continue/README.md`).
