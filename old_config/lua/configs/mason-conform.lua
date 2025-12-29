require("mason-conform").setup {
ensure_installed = {
    "stylua",        -- Lua
    "clang-format",  -- C / C++
    "black",         -- Python
    "shfmt",         -- Shell scripts
    "prettier",      -- HTML, CSS, JS, JSON
  },
  -- List of formatters to ignore during install
  ignore_install = {},
}
