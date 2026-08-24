return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.lsp.config("pyright", {})
    vim.lsp.enable("pyright")

    vim.lsp.config("clangd", {})
    vim.lsp.enable("clangd")

    vim.lsp.config("rust_analyzer", {})
    vim.lsp.enable("rust_analyzer")
  end,
}
