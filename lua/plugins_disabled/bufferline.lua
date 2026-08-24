-- Not currently active: this plugin was present in your old config but
-- never added to the plugin list, and its keymaps were commented out.
-- To enable it, move this file into lua/plugins/.
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      separator_style = "none",
      show_close_icon = false,
      show_buffer_close_icons = false,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bg = "NONE", bold = true })
  end,
}
