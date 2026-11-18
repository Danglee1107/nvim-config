return {
  {
    "HoNamDuong/hybrid.nvim",
    lazy = false,
    priority = 1000,

    config = function()
      require("hybrid").setup({
        terminal_colors = true,

        undercurl = true,
        underline = true,
        bold = true,

        italic = {
          strings = false,
          emphasis = true,
          comments = true,
          folds = true,
        },

        strikethrough = true,
        inverse = true,
        transparent = true,

        overrides = function(hl, c)
          -- Custom highlight overrides go here
        end,
      })

      vim.cmd.colorscheme("hybrid")
    end,
  },
}

-- return {
--   "savq/melange-nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme melange")
--     vim.opt.cursorline = true
--   end,
-- }
