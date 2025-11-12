
-- ~/.config/nvim/lua/configs/mason-lint.lua
-- Mason-Nvim-Lint setup (safe, no nils)

require("mason-nvim-lint").setup({
  -- List of linters to install
  ensure_installed = {
    "luacheck",    -- Lua
    "flake8",      -- Python
    "cpplint",     -- C/C++
    -- Add more linters here if you want
  },

  -- Automatically install missing linters (set false if you prefer manual install)
  automatic_installation = false,
})

