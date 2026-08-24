return {
  "savq/melange-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme melange")

    local transparent_groups = {
      "Normal", "NormalNC", "NormalFloat", "SignColumn", "EndOfBuffer",
      "LineNr", "FoldColumn", "CursorLine", "CursorLineNr", "StatusLine",
      "StatusLineNC", "TabLineFill", "WinSeparator",
    }
    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end

    vim.opt.cursorline = true

    vim.api.nvim_set_hl(0, "Visual", { bg = "#234452", fg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Cursor", { fg = "#F9E2AF", bg = "#202020" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })
    vim.api.nvim_set_hl(0, "NormalNC", { fg = "#f1e9d2", bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#e06c75" })
    vim.api.nvim_set_hl(0, "cFormatSpecifier", { fg = "#e06c75", bold = true })
    vim.api.nvim_set_hl(0, "@fmt", { fg = "#e06c75", bold = true })

    -- Telescope
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#43637E", bg = "#1e1e2e" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#43637E" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#43637E" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#43637E" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "NONE" })

    -- Completion (nvim-cmp)
    vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#1c1c1f", bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpPmenu", { bg = "#2F2F2F", fg = "#eee8d5" })
    vim.api.nvim_set_hl(0, "CmpSel", { bg = "#35444A", fg = "#ffffff", bold = true })
    vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = "#e06c75", bold = true })
  end,
}
