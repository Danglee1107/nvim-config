return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      window = {
        completion = cmp.config.window.bordered({
          border = "none",
          scrollbar = true,
          col_offset = -3,
          side_padding = 1,
          winhighlight = table.concat({
            "Normal:CmpPmenu",
            "FloatBorder:CmpBorder",
            "CursorLine:CmpSel",
            "Search:None",
          }, ","),
        }),
        documentation = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder",
        }),
      },

      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = { abbr = 35, menu = 20 },
          ellipsis_char = "…",
          menu = {
            nvim_lsp = "[LSP]",
            buffer = "[BUF]",
            path = "[PATH]",
            luasnip = "[SNIP]",
          },
          show_labelDetails = false,
        }),
      },

      mapping = cmp.mapping.preset.insert({
        ["<M-j>"] = cmp.mapping.select_next_item(),
        ["<M-k>"] = cmp.mapping.select_prev_item(),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      }),

      experimental = { ghost_text = false },
    })
  end,
}
