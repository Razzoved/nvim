return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- diagnostics
				null_ls.builtins.diagnostics.editorconfig_checker, -- .editorconfig
				null_ls.builtins.diagnostics.gdlint, -- godot
				null_ls.builtins.diagnostics.hadolint, -- dockerfile
				null_ls.builtins.diagnostics.phpcs, -- php
				null_ls.builtins.diagnostics.selene, -- lua
				-- formatting
				null_ls.builtins.formatting.csharpier, -- cs
				null_ls.builtins.formatting.fantomas, -- fsharp
				null_ls.builtins.formatting.gdformat, -- godot
				null_ls.builtins.formatting.pretty_php, -- php
				null_ls.builtins.formatting.prettierd, -- npm
				null_ls.builtins.formatting.stylua, -- lua
			},
		})
		require("mason-null-ls").setup({
			methods = {
				diagnostics = true,
				formatting = true,
				code_actions = false,
				completion = false,
				hover = false,
			},
			automatic_installation = true,
		})

		-- keybinds
		vim.keymap.set(
			"n",
			"<leader>gf",
			"<Cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>",
			{ noremap = true, silent = true }
		)
		--vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, {})
	end,
}
