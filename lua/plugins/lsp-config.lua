return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                PATH = "prepend"
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "csharp_ls",
                    "tsserver",
                    --"html",
                    --"intelephense"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- servers
            lspconfig.lua_ls.setup({})
            lspconfig.csharp_ls.setup({})
            lspconfig.tsserver.setup({})
            --lspconfig.html.setup({})
            --lspconfig.intelephense.setup({})

            -- keybinds
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}

