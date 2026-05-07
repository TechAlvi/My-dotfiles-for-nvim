return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "clangd" }
        },
    },
    {
        "neovim/nvim-lspconfig", -- still needed for server defs
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Lua LS
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })

            -- Clangd
            vim.lsp.config("clangd", {
                capabilities = capabilities,
            })

            -- Enable servers
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("clangd")

            -- Keymaps
            vim.keymap.set('n', 'K', vim.lsp.buf.hover)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
            vim.keymap.set({'n','v'}, '<leader>ca', vim.lsp.buf.code_action)

            -- Diagnostics
            vim.diagnostic.config({
                virtual_text = {
                    prefix = "●",
                    spacing = 2,
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })
        end,
    },
}
