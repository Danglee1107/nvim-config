-- Disable unused built-in plugins (startup speed)
local disabled_builtins = {
  "gzip", "zip", "zipPlugin", "tar", "tarPlugin",
  "getscript", "getscriptPlugin", "vimball", "vimballPlugin",
  "matchit", "matchparen", "netrw", "netrwPlugin", "netrwSettings",
  "netrwFileHandlers", "rplugin", "spellfile", "tutor", "2html_plugin",
  "logiPat", "rrhelper",
}

for _, p in ipairs(disabled_builtins) do
  vim.g["loaded_" .. p] = 1
end

-- Disable unused providers (startup speed).
-- ASSUMPTION: you don't rely on :python3/:ruby/:perl/:node host commands
-- or plugins that need them. Remove any of these lines if that's wrong.
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0

vim.loader.enable()
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.signcolumn = "no"
vim.opt.timeoutlen = 300
vim.opt.clipboard = "unnamedplus"
vim.g.tree_sitter_compiler = "gcc"
