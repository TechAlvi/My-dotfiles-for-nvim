local conform = require "conform"

conform.setup {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    sh = { "shfmt" },
  },
  format_on_save = {
    lsp_format = "fallback",
    timeout_ms = 500,
  },
}

vim.keymap.set({ "n", "v" }, "<leader>f", function()
  conform.format { async = true, lsp_fallback = true }
end, { desc = "Format file" })

require("conform").setup(options)
