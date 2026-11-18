return {
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },

    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },

    version = "1.*",

    opts = {
      -- Key mappings
      keymap = require("config.keymaps").blink,

      -- Appearance
      appearance = {
        nerd_font_variant = "mono",
      },

      -- Completion menu
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },

        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },

        menu = {
          border = "none",
          scrollbar = true,
          winblend = 0,

          draw = {
            align_to = "label",
            columns = {
              { "kind_icon","label" },
              { "kind" },
            },

            components = {
              kind_icon = {
                ellipsis = false,

                text = function(ctx)
                  return ctx.kind_icon .. " "
                end,
              },

              kind = {
                ellipsis = false,
              },

              label = {
                width = {
                  fill = true,
                  max = 35,
                },

                text = function(ctx)
                  return ctx.label
                end,
              },
            },
          },
        },

        -- Documentation window
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 300,

          window = {
            border = "none",
            winblend = 0,
          },
        },

        -- Ghost text
        ghost_text = {
          enabled = false,
        },
      },

      -- Sources
      sources = {
        default = {
          "lsp",
          "snippets",
          "path",
          "buffer",
        },

        providers = {
          lsp = {
            fallbacks = { "buffer" },
          },

          buffer = {
            min_keyword_length = 3,
            max_items = 5,
          },

          path = {
            min_keyword_length = 0,
          },

          snippets = {
            min_keyword_length = 2,
          },
        },
      },

      -- Snippet integration
      snippets = {
        preset = "luasnip",
      },

      -- Signature help
      signature = {
        enabled = false,
      },

      -- Fuzzy matching
      fuzzy = {
        implementation = "prefer_rust",
        sorts = {
          "exact",
          "score",
          "sort_text",
        },
      },
    },
  },
}

