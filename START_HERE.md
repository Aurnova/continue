# You're all set

- **Continue** uses **Qwen3 Coder Next** (OpenRouter). **Copilot** is disabled and uninstalled in this devcontainer.
- The layout is **Continue only**—no Copilot in the sidebar. If Copilot still appears (e.g. in the browser), open **Extensions** (Ctrl+Shift+X), search for "Copilot", and click **Uninstall**.
- **Config is stored in your home directory** (`~/.continue`) so Settings Sync and git don’t overwrite your model/key. If the model disappears after a sync, run `bash .devcontainer/setup-continue-config.sh` and **Developer: Reload Window**.

**To chat:** click **Continue** in the left sidebar, or press **Ctrl+L** (Mac: **Cmd+L**).

**Optional—open Continue on every start:** Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`) → **Tasks: Allow Automatic Tasks in Folder**. Next time you open this codespace, the Continue panel will focus automatically.

**If you see “Models Add-On” or setup prompts:** Continue needs your OpenRouter API key. Add it as a **Codespaces secret** named `OPENROUTER_API_KEY`, then **Codespaces: Rebuild Container** → **Developer: Reload Window**. **Still not working?** In the terminal, go to the workspace root then run the setup script:
```bash
cd /workspaces/continue && bash .devcontainer/setup-continue-config.sh
```
Then **Developer: Reload Window**.
