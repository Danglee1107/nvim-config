return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Pyright
    vim.lsp.config("pyright", {})
    vim.lsp.enable("pyright")

    -- Ruff
    vim.lsp.config("ruff", {})
    vim.lsp.enable("ruff")

    -- Disable Ruff hover (keep Pyright hover)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client.name == "ruff" then
          client.server_capabilities.hoverProvider = false
        end
      end,
    })

    -- C/C++
    vim.lsp.config("clangd", {})
    vim.lsp.enable("clangd")

    -- Rust
    vim.lsp.config("rust_analyzer", {})
    vim.lsp.enable("rust_analyzer")
  end,
}
