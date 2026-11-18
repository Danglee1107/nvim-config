-- main
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<M-v>", "<C-v>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })

-- reload neovim
vim.keymap.set("n", "<leader>r", function()
  vim.cmd("restart")
  vim.notify("Neovim config reloaded!")
end, { desc = "Reload Neovim config" })

-- surround
vim.keymap.set("n", '<leader>a', 'ysib', { remap = true, desc = 'Surround inside ()' })
vim.keymap.set("n", '<leader>w', 'ysiw', { remap = true, desc = 'Surround a word' })
vim.keymap.set("n", '<leader>s', 'yss', { remap = true, desc = 'Surround entire a line' })

-- completion
local M = {}

M.blink = {
  preset = "none",

  ["<M-j>"] = { "select_next", "fallback" },
  ["<M-k>"] = { "select_prev", "fallback" },

  ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
  ["<C-e>"] = { "hide", "fallback" },

  ["<CR>"] = { "accept", "fallback" },

  ["<C-f>"] = { "scroll_documentation_down", "fallback" },
  ["<C-b>"] = { "scroll_documentation_up", "fallback" },

  ["<Tab>"] = { "snippet_forward", "fallback" },
  ["<S-Tab>"] = { "snippet_backward", "fallback" },
}

return M
