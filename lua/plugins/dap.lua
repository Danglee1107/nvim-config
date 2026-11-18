return {
  {
    "mfussenegger/nvim-dap",
    lazy = false,

    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          "nvim-neotest/nvim-nio",
        },
        opts = {
          icons = {
            expanded = "▾",
            collapsed = "▸",
            current_frame = "▸",
          },

          mappings = {
            expand = { "<CR>", "o" },
            open = "O",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
          },

          layouts = {
            {
              elements = {
                { id = "scopes", size = 0.40 },
                { id = "stacks", size = 0.30 },
                { id = "breakpoints", size = 0.15 },
                { id = "watches", size = 0.15 },
              },
              size = 40,
              position = "left",
            },
            {
              elements = {
                { id = "repl", size = 0.45 },
                { id = "console", size = 0.55 },
              },
              size = 12,
              position = "bottom",
            },
          },

          floating = {
            max_height = nil,
            max_width = nil,
            border = "rounded",
            mappings = {
              close = { "q", "<Esc>" },
            },
          },

          windows = {
            indent = 1,
          },
        },
      },

      "mfussenegger/nvim-dap-python",

      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {
          enabled = true,
          enabled_commands = true,
          highlight_changed_variables = true,
          highlight_new_as_changed = true,
          show_stop_reason = true,
          commented = false,
          virt_text_pos = "eol",
        },
      },
    },

    keys = {
      -- UI
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle Debug UI",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        desc = "Evaluate Expression",
        mode = { "n", "v" },
      },

      -- Breakpoints
      {
        "<leader>=",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(
            vim.fn.input("Breakpoint condition: ")
          )
        end,
        desc = "Conditional Breakpoint",
      },

      -- Execution
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate Debugging",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      -- Python
      require("dap-python").setup("python3")

      -- C & Rust
      dap.adapters.codelldb = {
        type = "executable",
        command = "codelldb",
      }

      local codelldb_config = {
        name = "Launch executable",
        type = "codelldb",
        request = "launch",

        program = function()
          return vim.fn.input(
            "Executable path: ",
            vim.fn.getcwd() .. "/",
            "file"
          )
        end,

        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      }

      dap.configurations.c = {
        vim.deepcopy(codelldb_config),
      }

      dap.configurations.cpp = {
        vim.deepcopy(codelldb_config),
      }

      dap.configurations.rust = {
        vim.deepcopy(codelldb_config),
      }

      -- DAP UI listeners
      dap.listeners.after.event_initialized["dapui_config"] =
        function()
          dapui.open()
        end

      dap.listeners.before.event_terminated["dapui_config"] =
        function()
          dapui.close()
        end

      dap.listeners.before.event_exited["dapui_config"] =
        function()
          dapui.close()
        end

      -- Breakpoint signs
      vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "DiagnosticError",
      })

      vim.fn.sign_define("DapBreakpointCondition", {
        text = "◆",
        texthl = "DiagnosticWarn",
      })

      vim.fn.sign_define("DapLogPoint", {
        text = "◆",
        texthl = "DiagnosticInfo",
      })

      vim.fn.sign_define("DapStopped", {
        text = "▶",
        texthl = "DiagnosticWarn",
        linehl = "Visual",
      })
    end,
  },
}
