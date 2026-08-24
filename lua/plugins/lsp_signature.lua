return {
  "ray-x/lsp_signature.nvim",
  event = "LspAttach",
  config = function()
    require("lsp_signature").setup({
      handler_opts = { border = "rounded" },
      hi_parameter = "LspSignatureActiveParameter",
      hint_enable = false,
    })
  end,
}
