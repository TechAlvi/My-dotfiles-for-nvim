return {

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.treesitter"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lspconfig" },
    config = function()
      require "configs.mason-lspconfig"
    end,
  },

  {
    "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    -- force re-register clang_tidy after Lazy resets table
    vim.schedule(function()
      lint.linters.clang_tidy = {
        cmd = "clang-tidy",
        stdin = false,
        args = { "--quiet", "--" },
        ignore_exitcode = true,
        parser = function(output, bufnr)
          local diagnostics = {}
          for file, line, col, message, code in output:gmatch("([%w%p]+):(%d+):(%d+):[%s%a]*: (.-) %[([%w%-_]+)%]") do
            table.insert(diagnostics, {
              lnum = tonumber(line) - 1,
              col = tonumber(col) - 1,
              message = message .. " [" .. code .. "]",
              severity = vim.diagnostic.severity.WARN,
              source = "clang-tidy",
            })
          end
          return diagnostics
        end,
      }

      lint.linters_by_ft = {
        lua = { "luacheck" },
        python = { "flake8" },
        cpp = { "clang_tidy" },
      }

      -- optional luacheck tweaks
      if lint.linters.luacheck then
        lint.linters.luacheck.args = {
          "--globals", "love", "vim",
          "--formatter", "plain",
          "--codes", "--ranges", "-"
        }
      end

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end)
  end
  },

  {
    "rshkarin/mason-nvim-lint",
    event = "VeryLazy",
    dependencies = { "nvim-lint" },
    config = function()
      require "configs.mason-lint"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "zapling/mason-conform.nvim",
    event = "VeryLazy",
    dependencies = { "conform.nvim" },
    config = function()
      require "configs.mason-conform"
    end,
  },
}
