# Continue + OpenRouter (Qwen3 Coder Next)

**Zero setup for students:** open in Codespace and chat. Model and API key are baked in—no sign-in, no key, no model selection.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/Aurnova/continue?quickstart=1)

---

## 1. Open in Codespace

Use the **Open in GitHub Codespaces** link above, or **Code** → **Codespaces** → **Create codespace on main**. Continue is installed automatically.

**If Continue isn’t set up or Copilot still appears:** **Command Palette** (`Ctrl+Shift+P` / `Cmd+Shift+P`) → **Codespaces: Rebuild Container**. The devcontainer copies the baked-in config into the container and uninstalls Copilot.

**Faster startup (prebuilds):** An org admin can enable prebuilds so each student’s codespace starts in seconds: repo **Settings** → **Codespaces** → **Set up prebuild** (branch **main**, config **.devcontainer/devcontainer.json**).

## 2. Chat

Click **Continue** in the sidebar or press **`Ctrl+L`** / **`Cmd+L`**. Chat and autocomplete use **Qwen3 Coder Next** via OpenRouter—nothing to add or configure.

---

**Local VS Code:** Clone, install [Continue](https://marketplace.visualstudio.com/items?itemName=Continue.continue); model and key are already in the repo.

> **Note:** The OpenRouter API key is in this repo so students don’t have to add one. If the repo is public, consider revoking it at [openrouter.ai/keys](https://openrouter.ai/keys) and using [Codespace secrets](https://docs.github.com/en/codespaces/managing-your-codespaces/managing-encrypted-secrets-for-your-codespaces) instead.
