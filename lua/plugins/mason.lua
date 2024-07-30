return {
	"williamboman/mason.nvim",
	lazy = false,
	config = function()
		require("mason").setup({
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
	end,
}
