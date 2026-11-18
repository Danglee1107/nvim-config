vim.diagnostic.config({
  virtual_text = {
    enabled = true,
    source = "if_many",
    spacing = 4,
    prefix = "●",
  },

  virtual_lines = false,

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },

  underline = true,
  update_in_insert = false,
  severity_sort = true,

  float = {
    border = "rounded",
    source = true,
  },
})
