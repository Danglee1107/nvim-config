# nvim config layout

```
nvim/
├── init.lua                 -- entry point, just requires config/*
├── lazy-lock.json           
└── lua/
    ├── config/
    │   ├── options.lua      -- vim.opt / vim.g settings + disabled builtins
    │   ├── keymaps.lua      -- global keymaps
    │   ├── runner.lua       -- <C-A-n> compile-and-run
    │   └── lazy.lua         -- bootstraps lazy.nvim, auto-imports lua/plugins/
    └── plugins/              -- add new plugin here
        ├── theme.lua
        ├── lualine.lua
        ├── comment.lua
        ├── telescope.lua
        ├── lsp.lua
        ├── lsp_signature.lua
        ├── completion.lua
        ├── treesitter.lua
        ├── neo-tree.lua
        ├── noice.lua
        └── colorizer.lua
```

## Installation

### Linux/ macOS

```bash
git clone https://github.com/Danglee1107/nvim-config.git ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

### Windows (PowerShell)

```powershell
git clone https://github.com/Danglee1107/nvim-config.git "$env:LOCALAPPDATA\nvim"
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim\.git"
```

### Verify

Start Neovim:

```bash
nvim
```

> **Note:** Removing the `.git` directory disconnects the configuration from the original Git repository, allowing you to initialize your own repository if desired.

## Adding a new plugin
Create one file in `lua/plugins/`, e.g. `lua/plugins/foo.lua`:
```lua
return {
  "author/foo.nvim",
  event = "VeryLazy",   -- or cmd/ft/keys — lazy-load, don't load eagerly
  opts = {},
}
```
