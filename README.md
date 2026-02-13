# Continue + OpenRouter (Qwen3 Coder Agent)

**Super simple:** open in Codespace and chat. OpenRouter key is already configured.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/Aurnova/continue?quickstart=1)

---

## 1. Open in Codespace

Use the **Open in GitHub Codespaces** link above, or **Code** → **Codespaces** → **Create codespace on main**. Continue is installed automatically when the codespace builds from the devcontainer.

**If Continue isn’t there** (e.g. you opened the codespace before the devcontainer existed): **Command Palette** (`Ctrl+Shift+P` / `Cmd+Shift+P`) → **Codespaces: Rebuild Container**. After the rebuild, the extension will be installed.

**Faster startup (prebuilds):** To make every student’s codespace start in seconds instead of 1–2 minutes, an org admin can enable prebuilds:

1. Repo **Settings** → **Code & automation** → **Codespaces**.
2. Under **Prebuild configuration**, click **Set up prebuild**.
3. Choose branch **main**, config file **.devcontainer/devcontainer.json**.
4. Trigger: **Every push** (or **On configuration change** to use fewer Actions minutes).
5. Click **Create**. The first prebuild will run in Actions; after it completes, new codespaces use it automatically.

## 2. Chat

Click **Continue** in the sidebar or press **`Ctrl+L`** / **`Cmd+L`**. No API key step—Qwen3 Coder Agent via OpenRouter is already set up.

---

**Local VS Code:** Clone, install [Continue](https://marketplace.visualstudio.com/items?itemName=Continue.continue), then open chat (key is already in the repo).

> **Note:** The OpenRouter API key is in this repo for zero-friction demo use. If the repo is public, consider revoking that key at [openrouter.ai/keys](https://openrouter.ai/keys) and using [Codespace secrets](https://docs.github.com/en/codespaces/managing-your-codespaces/managing-encrypted-secrets-for-your-codespaces) instead.
