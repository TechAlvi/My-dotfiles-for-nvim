local lint = require "lint"

lint.linters_by_ft = {
  lua = { "luacheck" },
  -- haskell = { "hlint" },
  python = { "flake8" },
  cpp = { "clang_tidy" },
}

lint.linters.luacheck.args = {
  "--globals",
  "love",
  "vim",
  "--formatter",
  "plain",
  "--codes",
  "--ranges",
  "-",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
