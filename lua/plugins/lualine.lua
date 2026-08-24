return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local theme = require("lualine.themes.melange")

    theme.normal.a.fg = "#15161e"
    for _, mode in ipairs({ "normal", "replace", "inactive", "insert", "visual", "terminal", "command" }) do
      if theme[mode] then
        for _, section in ipairs({ "c", "x", "y", "z" }) do
          if theme[mode][section] then
            theme[mode][section].bg = "#1c1c1f"
          end
        end
      end
    end

    require("lualine").setup({
      options = {
        theme = theme,
        globalstatus = true,
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { {
          function() return "" .. require("lualine.utils.mode").get_mode() end,
            separator = { right = "" },
        } },
        lualine_b = { {
          "branch", icon = "",
            separator = { left = "", right = "" },
        } },
        lualine_c = {
          { "filetype", icon_only = true, separator = { left = "", right = "" } },
          "filename",
        },
        lualine_x = {},
        lualine_y = { "progress", "location" },
        lualine_z = { {
          function() return os.date("%H:%M") end,
            separator = { left = "" },
        } },
      },
    })
  end,
}
