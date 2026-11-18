
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local colors = _G.colors.lualine

    local mode_colors = {
      normal = colors.blue,
      insert = colors.green,
      visual = colors.purple,
      replace = colors.red,
      command = colors.yellow,
      terminal = colors.cyan,
    }

    local custom_theme = {}

    for mode, color in pairs(mode_colors) do
      custom_theme[mode] = {
        a = { fg = colors.black, bg = color, gui = "bold" },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
      }
    end

    custom_theme.inactive = {
      a = { fg = colors.muted, bg = colors.bg },
      b = { fg = colors.muted, bg = colors.bg },
      c = { fg = colors.muted, bg = colors.bg },
    }

    require("lualine").setup({
      options = {
        theme = custom_theme,
        globalstatus = true,

        section_separators = {
          left = "",
          right = "",
        },

        component_separators = {
          left = "",
          right = "",
        },
      },

      sections = {
        lualine_a = {
          {
            "mode",
            separator = { right = "" },
            color = { gui = "bold" },
          },
        },

        lualine_b = {
          {
            "branch",
            icon = "",
            color = function()
              local mode = require("lualine.utils.mode").get_mode()
              local mode_color = mode_colors[mode:lower()] or colors.blue

              return {
                fg = mode_color,
                bg = colors.branch_bg,
                gui = "bold",
              }
            end,
            separator = {
              left = "",
              right = "",
            },
          },
        },

        lualine_c = {
          { "filetype", icon_only = true },
          "filename",
        },

        lualine_x = {},

        lualine_y = {
          "location",
        },

        lualine_z = {
          {
            function()
              return os.date("%H:%M")
            end,
            separator = { left = "" },
            color = { gui = "bold" },
          },
        },
      },
    })
  end,
}
