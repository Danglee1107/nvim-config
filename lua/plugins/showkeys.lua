
return {
  "nvzone/showkeys",
  event = "VeryLazy",
  cmd = "ShowkeysToggle",

  opts = {
      winopts = {
        relative = "editor",
        style = "minimal",
        border = "none",
        height = 1,
        zindex = 100,
      },
    timeout = 1,
    maxkeys = 3,
    show_count = false,
    excluded_modes = { "i" },

    position = "bottom-right",

    keyformat = {
      ["<BS>"] = "󰁮 ",
      ["<CR>"] = "󰘌",
      ["<Space>"] = "󱁐",
      ["<Up>"] = "󰁝",
      ["<Down>"] = "󰁅",
      ["<Left>"] = "󰁍",
      ["<Right>"] = "󰁔",
      ["<PageUp>"] = "Page 󰁝",
      ["<PageDown>"] = "Page 󰁅",
      ["<M>"] = "Alt",
      ["<C>"] = "Ctrl",
    },
  },

  config = function(_, opts)
    require("showkeys").setup(opts)

    vim.keymap.set("n", "<leader>sk", "<cmd>ShowkeysToggle<CR>", {
      desc = "Toggle Showkeys",
      silent = true,
    })

    -- Automatically show when Neovim starts
    vim.schedule(function()
      vim.cmd("ShowkeysToggle")
    end)
  end,
}
