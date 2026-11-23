return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },

    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({
            async = true,
            lsp_format = "never",
          })
        end,
        mode = "",
        desc = "Format code",
      },
    },

    opts = {
      formatters_by_ft = {
        python = {
          "ruff_fix",
          "ruff_format",
          "ruff_organize_imports",
        },
        rust = {
            "rustfmt",
        },
      },

      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "never",
      },
    },
  },
}
