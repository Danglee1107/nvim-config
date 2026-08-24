return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua", "vim", "python", "java", "json", "c",
        "markdown", "markdown_inline", "rust", "css", "html",
      },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
