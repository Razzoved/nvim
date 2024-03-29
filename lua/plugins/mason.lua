return {
	"williamboman/mason.nvim",
	lazy = false,
	config = function()
		require("mason").setup({
			PATH = "prepend",
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
	end,
}
