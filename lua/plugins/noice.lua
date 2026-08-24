-- NOTE: the original config defined "folke/noice.nvim" twice (noice.lua and
-- popup.lua), each with different opts. lazy.nvim would only keep one of
-- them non-deterministically. Merged into a single spec here.
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
    },
    popupmenu = {
      enabled = true,
    },
    messages = {
      enabled = true,
    },
    notify = {
      enabled = true,
    },
    lsp = {
      progress = {
        enabled = false,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
  },
  config = function(_, opts)
    require("noice").setup(opts)
    require("notify").setup({
      background_colour = "#000000",
    })
  end,
}
