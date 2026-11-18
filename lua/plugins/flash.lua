return {
  "folke/flash.nvim",
  opts = {
    modes = {
      char = {
        enabled = false,
      },
      search = {
        enabled = false,
      },
    },
  },

  keys = {
    {
      "f",
      function()
        require("flash").jump()
      end,
      mode = { "n", "x", "o" },
      desc = "Flash Jump",
    },
  },
}
