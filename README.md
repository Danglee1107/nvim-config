# nvim config layout

```
nvim/
├── init.lua                 -- entry point, just requires config/*
├── lazy-lock.json           -- unchanged from your original
└── lua/
    ├── config/
    │   ├── options.lua      -- vim.opt / vim.g settings + disabled builtins
    │   ├── keymaps.lua      -- global keymaps
    │   ├── runner.lua       -- <C-A-n> compile-and-run
    │   └── lazy.lua         -- bootstraps lazy.nvim, auto-imports lua/plugins/
    ├── plugins/              -- ONE FILE PER PLUGIN, auto-loaded
    │   ├── theme.lua
    │   ├── lualine.lua
    │   ├── comment.lua
    │   ├── telescope.lua
    │   ├── lsp.lua
    │   ├── lsp_signature.lua
    │   ├── completion.lua
    │   ├── treesitter.lua
    │   ├── neo-tree.lua
    │   ├── noice.lua
    │   └── colorizer.lua
    └── plugins_disabled/
        └── bufferline.lua   -- present in your old config but never wired
                                 in and not loaded here; move it into
                                 lua/plugins/ to enable it
```

Install: copy the `nvim/` folder to `~/.config/nvim` (Linux/macOS) or
`%localappdata%/nvim` (Windows).

## Adding a new plugin
Create one file in `lua/plugins/`, e.g. `lua/plugins/foo.lua`:
```lua
return {
  "author/foo.nvim",
  event = "VeryLazy",   -- or cmd/ft/keys — lazy-load, don't load eagerly
  opts = {},
}
```
That's it — `lua/config/lazy.lua` imports every file under `lua/plugins/`
automatically via `{ import = "plugins" }`. No other file needs editing.
lazy.nvim also scans subdirectories of `lua/plugins/`, which is why the
disabled bufferline spec lives in a sibling `lua/plugins_disabled/`
folder instead — otherwise it'd get auto-loaded too.

## What changed from your original config, and why

- **Bugs fixed:**
  - `noice.lua` and `popup.lua` both declared the `"folke/noice.nvim"`
    plugin separately with different `opts`/`config` — lazy.nvim would
    only keep one non-deterministically. Merged into one `plugins/noice.lua`.
  - `telescope.lua` built a `defaults = {...}` table but never passed it
    into `require("telescope").setup(...)` — it was a dangling local/global
    that did nothing. Now actually passed to `setup()`.
- **Startup performance:**
  - `completion.lua` (nvim-cmp) now loads on `InsertEnter` instead of eagerly.
  - `lsp.lua`, `treesitter.lua` now load on `BufReadPre`/`BufNewFile`
    instead of unconditionally at startup.
  - `telescope.lua`, `neo-tree.lua` (already lazy via `keys`) now also
    lazy-load via `cmd`.
  - `lualine.lua`, `noice.lua`/`popup.lua` now load on `VeryLazy`.
  - `comment.lua` now loads on the `gc`/`gb` keys instead of eagerly.
  - Added a few more `loaded_*` builtin disables and disabled the
    perl/ruby/node/python3 providers in `options.lua` — **assumption**:
    you don't use `:python3`/`:ruby`/etc. host commands. Remove those
    lines in `options.lua` if that's wrong.
  - `checker.enabled = false` and `change_detection.notify = false` in
    `lazy.lua` so lazy.nvim doesn't poll for plugin updates on every start.
- **Reorganized, not changed:**
  - The big block of `vim.api.nvim_set_hl(...)` calls that used to sit in
    `plugins.lua` (Telescope/Cmp/Cursor/etc. highlights) is moved into
    `plugins/theme.lua`, since they're all colorscheme overlays and only
    make sense once `melange` is active.
  - `RunProgram()` moved out of `plugins.lua` into `config/runner.lua` —
    it's editor tooling, not a plugin spec.
