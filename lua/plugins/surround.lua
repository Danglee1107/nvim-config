return {
  "kylechui/nvim-surround",
  version = "^4.0.0",
  event = "VeryLazy",

  opts = {
    -- Highlight the surrounding text briefly
    highlight = {
      duration = 250,
    },

    -- Keep cursor behavior predictable
    move_cursor = "begin",

    -- Automatically indent multiline surrounds
    indent_lines = function(start, stop)
      return start < stop
    end,
  },
}
