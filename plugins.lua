local plugins = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = "mfussenegger/nvim-dap",
      config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end
    },
    {
      "mfussenegger/nvim-dap",
      config = function(_, opts)
        require("core.utils").load_mappings("dap")
      end
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      ft = {"python"},
      opts = function()
        return require "custom.configs.null-ls"
      end,
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        require "custom.configs.lspconfig_"
        require "plugins.configs.lspconfig"
      end,
    },
    {
       "williamboman/mason.nvim",
       opts = {
            ensure_installed = {
                "black",
                "debugpy",
                "mypy",
                "ruff",
                "pyright",
            }
        },
      PATH = "prepend"
    },

}

return plugins
