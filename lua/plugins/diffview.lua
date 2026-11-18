return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
      "DiffviewClose",
      "DiffviewFocusFiles",
      "DiffviewToggleFiles",
    },
    keys = {
      {
        "<leader>gd",
        "<cmd>DiffviewOpen<CR>",
        desc = "Open Git Diff",
      },
      {
        "<leader>gh",
        "<cmd>DiffviewFileHistory %<CR>",
        desc = "File Git History",
      },
      {
        "<leader>gH",
        "<cmd>DiffviewFileHistory<CR>",
        desc = "Repository Git History",
      },
      {
        "<leader>gD",
        "<cmd>DiffviewClose<CR>",
        desc = "Close Git Diff",
      },
      {
        "<leader>gf",
        "<cmd>DiffviewToggleFiles<CR>",
        desc = "Toggle Diff Files",
      },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          layout = "diff2_horizontal",
        },
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    },
  },
}
