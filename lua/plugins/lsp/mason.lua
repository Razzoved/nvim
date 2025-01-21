return {
	"williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
	lazy = false,
	config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			PATH = "prepend",
            max_concurrent_installers = 2,
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                --[[ COMPILED LANGUAGES ]]
                "csharp_ls",
                "fsautocomplete",
                "gopls",
                --[[ SCRIPTING LANGUAGES ]]
                "lua_ls",
                "intelephense", -- php
                --[[ UTILITIES ]]
                "sqls",
                "dockerls",
                "powershell_es",
                "taplo", -- toml
                "jsonls",
            },
            -- auto-install configured servers (with the plugin)
            automatic_installation = true,
        })
	end,
}
