-- blink cmp
local bg = "#1f1f1f"

-- Kind
local kind_colors = {
  Function = "#dcdcaa",
  Method = "#dcdcaa",
  Constructor = "#dcdcaa",

  Class = "#c586c0",
  Struct = "#c586c0",
  Interface = "#c586c0",
  Enum = "#c586c0",
  EnumMember = "#c586c0",

  Variable = "#9cdcfe",
  Field = "#9cdcfe",
  Property = "#9cdcfe",

  Keyword = "#c586c0",
  Constant = "#ce9178",
  Module = "#ce9178",
  Namespace = "#ce9178",

  Operator = "#d4d4d4",
  TypeParameter = "#4ec9b0",
  Snippet = "#4ec9b0",
  Text = "#d4d4d4",
  Unit = "#b5cea8",
  Value = "#b5cea8",
  Reference = "#9cdcfe",
  File = "#ce9178",
  Folder = "#ce9178",
  EnumMember = "#c586c0",
}

for kind, color in pairs(kind_colors) do
  vim.api.nvim_set_hl(0, "BlinkCmpKind" .. kind, {
    fg = color,
    bg = bg,
  })
end

vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = bg, })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#454545", bg = bg, })
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { fg = "#ffffff", bg = "#343434", })
vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = "#d4d4d4", bg = bg, })
vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = "#569cd6", bold = true, })
vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { fg = "#808080", bg = bg, })
vim.api.nvim_set_hl(0, "BlinkCmpLabelDetail", { fg = "#808080", bg = bg, })
vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = "#d4d4d4", bg = bg, })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#454545", bg = bg, })
vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { fg = "#454545", bg = bg, })
vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { fg = "#666666", })
vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { bg = "#454545", })
vim.api.nvim_set_hl(0, "BlinkCmpScrollBarGutter", { bg = bg, })

-- aerial
vim.api.nvim_set_hl(0, "AerialLine", { fg = "#89B4FA", bg = "#263449", bold = true, })
vim.api.nvim_set_hl(0, "AerialLineNC", { fg = "#89B4FA", bg = "#263449", bold = true, })

local aerial_colors = {
  Function = "#88C0D0",
  Method = "#88C0D0",
  Class = "#EBCB8B",
  Struct = "#EBCB8B",
  Interface = "#EBCB8B",
  Enum = "#B48EAD",
  EnumMember = "#B48EAD",
  Constant = "#D08770",
  Variable = "#A3BE8C",
  Field = "#A3BE8C",
  Module = "#8FBCBB",
  Namespace = "#8FBCBB",
  Property = "#81A1C1",
}

for kind, color in pairs(aerial_colors) do
  -- Symbol name
  vim.api.nvim_set_hl(0, "Aerial" .. kind, { fg = color, })
  -- Symbol icon
  vim.api.nvim_set_hl(0, "Aerial" .. kind .. "Icon", { fg = color, })
end

local transparent_groups = {
  "Normal", "NormalNC", "NormalFloat", "SignColumn", "EndOfBuffer",
  "LineNr", "FoldColumn", "CursorLine", "CursorLineNr", "StatusLine",
  "StatusLineNC", "TabLineFill", "WinSeparator",
}
for _, group in ipairs(transparent_groups) do
  vim.api.nvim_set_hl(0, group, { bg = "NONE" })
end

-- Lualine
local lualine_colors = {
  bg = "#232323",
  fg = "#D8DEE9",
  muted = "#616E88",
  black = "#000000",

  blue = "#81A2BE",
  cyan = "#8FBCBB",
  purple = "#B48EAD",
  yellow = "#EBCB8B",
  orange = "#D08770",
  red = "#BF616A",
  green = "#A3BE8C",

  branch_bg = "#484848",
}
_G.colors = _G.colors or {}
_G.colors.lualine = lualine_colors

-- main
vim.api.nvim_set_hl(0, "Visual", { bg = "#234452", fg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Cursor", { fg = "#F9E2AF", bg = "#202020" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#6C7086"})
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "NormalNC", { fg = "#f1e9d2", bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#373B41" })
vim.api.nvim_set_hl(0, "cFormatSpecifier", { fg = "#373B41", bold = true })
vim.api.nvim_set_hl(0, "@fmt", { fg = "#373B41", bold = true })

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#43637E", bg = "#1e1e2e" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#43637E" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#43637E" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#43637E" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "NONE" })

vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = "#e06c75", bold = true })
