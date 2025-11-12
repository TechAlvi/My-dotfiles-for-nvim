-- -- local lspconfig = package.loaded["lspconfig"] -- pre nvim 0.11
-- local lspconfig = require("nvchad.configs.lspconfig") -- nvim 0.11
--
-- -- List of servers to ignore during install
-- local ignore_install = {}
--
-- -- Helper function to find if value is in table.
-- local function table_contains(table, value)
--     for _, v in ipairs(table) do
--         if v == value then
--             return true
--         end
--     end
--     return false
-- end
--
-- -- Build a list of lsp servers to install minus the ignored list.
-- local all_servers = {}
-- for _, s in ipairs(lspconfig.servers) do
--     if not table_contains(ignore_install, s) then
--         table.insert(all_servers, s)
--     end
-- end
--
-- require("mason-lspconfig").setup({
--     ensure_installed = all_servers,
--     automatic_installation = false,
-- })



-- ~/.config/nvim/lua/configs/mason-lspconfig.lua
-- Mason-LSPConfig setup file for Neovim

-- Define the list of LSP servers you want Mason to manage and install
-- local servers = {
--   "lua_ls",     -- Lua
--   "clangd",     -- C / C++
--   "pyright",    -- Python
--   "bashls",     -- Bash
--   "jsonls",     -- JSON
--   "html",       -- HTML
--   "cssls",      -- CSS
-- }
--
-- -- Setup mason-lspconfig
-- require("mason-lspconfig").setup({
--   ensure_installed = servers,
--   automatic_installation = false, -- set true if you want Mason to auto install missing ones
-- })
--
-- -- Load the main LSP config handler
-- local lspconfig = require("lspconfig")
--
-- -- Apply default setup to each server listed above
-- for _, server in ipairs(servers) do
--   lspconfig[server].setup({})
-- end




-- ~/.config/nvim/lua/configs/mason-lspconfig.lua
-- Updated for Neovim 0.11+ (no deprecated lspconfig)

-- Define which LSP servers to install
-- local servers = {
--   "lua_ls",
--   "clangd",
--   "pyright",
--   "bashls",
--   "jsonls",
--   "html",
--   "cssls",
-- }
--
-- -- Setup Mason-LSPConfig to ensure servers are installed
-- require("mason-lspconfig").setup({
--   ensure_installed = servers,
--   automatic_installation = false,
-- })
--
-- -- Modern Neovim LSP setup (replaces require("lspconfig"))
-- for _, server in ipairs(servers) do
--   vim.lsp.config(server, {
--     capabilities = vim.lsp.protocol.make_client_capabilities(),
--     settings = {},
--   })
-- end
--
-- -- Optional: Automatically start servers
-- for _, server in ipairs(servers) do
--   vim.lsp.start({ name = server })
-- end






-- ~/.config/nvim/lua/configs/mason-lspconfig.lua

local servers = {
  "lua_ls",
  "clangd",
  "pyright",
  "bashls",
  "jsonls",
  "html",
  "cssls",
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true, -- let Mason handle missing servers
})

-- Modern LSP setup, no manual start
for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    settings = {},
  })
end
