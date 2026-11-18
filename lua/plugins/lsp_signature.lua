return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",

  opts = {
    bind = true,

    floating_window = true,
    floating_window_above_cur_line = true,

    hint_enable = true,
    hint_prefix = "󰊕 ",

    hi_parameter = "LspSignatureActiveParameter",

    handler_opts = {
      border = "rounded",
    },

    -- Faster parameter highlighting
    timer_interval = 50,
    cursorhold_update = true,

    -- Trigger signature updates
    extra_trigger_chars = { "(", "," },

    max_height = 12,
    max_width = 80,
  },
}
