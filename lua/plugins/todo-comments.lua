return {
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = { "BufReadPost", "BufNewFile" },

    opts = {
        signs = true, -- show icons in the signs column
        sign_priority = 8, -- sign priority
    },


    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next TODO comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous TODO comment",
      },
      {
        "<leader>t",
        "<cmd>TodoTelescope<cr>",
        desc = "Search TODO comments",
      },
      {
        "<leader>sT",
        "<cmd>TodoTelescope keywords=TODO,FIX,BUG<cr>",
        desc = "Search TODO/FIX/BUG",
      },
      {
        "<leader>xt",
        "<cmd>Trouble todo toggle<cr>",
        desc = "TODOs (Trouble)",
      },
    },
  },
}
