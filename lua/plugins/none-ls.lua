return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = {
				-- lua
                "stylua",
                -- c#
                "csharpier"
			},
			automatic_installation = false,
			handlers = {},
		})
		require("null-ls").setup()

		-- keybinds
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
