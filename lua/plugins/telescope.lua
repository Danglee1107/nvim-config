return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader><leader>", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        border = true,
        borderchars = {
          "─", "│", "─", "│", "╭", "╮", "╯", "╰",
        },
      },
    })
  end,
}
