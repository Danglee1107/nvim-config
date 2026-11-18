return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- Compare working tree against the last commit
      base = "HEAD",

      signs = {
        add = { text = " ▎" },
        change = { text = " ▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = " ▎" },
        untracked = { text = " ┆" },
      },

      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,

      current_line_blame = false,
      current_line_blame_opts = {
        delay = 500,
        virt_text_pos = "eol",
      },

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(keys, fn, desc)
          vim.keymap.set("n", keys, fn, {
            buffer = bufnr,
            desc = desc,
          })
        end

        -- Navigate between changed hunks
        map("]h", gs.next_hunk, "Next Git hunk")
        map("[h", gs.prev_hunk, "Previous Git hunk")

        -- Stage / reset hunks
        map("<leader>hs", gs.stage_hunk, "Stage hunk")
        map("<leader>hr", gs.reset_hunk, "Reset hunk")
        map("<leader>hS", gs.stage_buffer, "Stage buffer")
        map("<leader>hR", gs.reset_buffer, "Reset buffer")

        -- Preview / blame
        map("<leader>hp", gs.preview_hunk, "Preview hunk")
        map("<leader>hb", gs.blame_line, "Blame line")
        map("<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

        -- Diff
        map("<leader>hd", gs.diffthis, "Diff this")
        map("<leader>hD", function()
          gs.diffthis("~1")
        end, "Diff against previous commit")
      end,
    },
  },
}
