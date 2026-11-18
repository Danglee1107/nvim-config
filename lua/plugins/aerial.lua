
return {
  {
    "stevearc/aerial.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      backends = { "treesitter", "lsp", "markdown" },

      layout = {
        default_direction = "left",
        placement = "window",
        width = 35,
        min_width = 25,
        max_width = 40,
        resize_to_content = false,
      },

      attach_mode = "window",

      show_guides = true,
      highlight_on_hover = true,
      highlight_on_jump = 300,

      -- Automatically jump to the symbol under the cursor
      autojump = true,

      -- Keep Aerial open after selecting
      close_on_select = false,

      -- Show all relevant symbol types
      filter_kind = false,

      -- Highlight selected symbol
      highlight_mode = "full_width",

      manage_folds = false,
      link_tree_to_folds = false,

      -- Keybindings inside Aerial
      keymaps = {
        ["j"] = "actions.down",
        ["k"] = "actions.up",

        ["<CR>"] = "actions.jump",
        ["q"] = "actions.close",

        ["o"] = "actions.tree_toggle",
        ["za"] = "actions.tree_toggle",

        ["l"] = "actions.tree_open",
        ["h"] = "actions.tree_close",

        ["O"] = "actions.tree_open_recursive",
        ["H"] = "actions.tree_close_recursive",
      },
    },

    keys = {
      {
        "<leader>o",
        "<cmd>AerialToggle<cr>",
        desc = "Toggle Aerial Outline",
      },
    },
  },
}
