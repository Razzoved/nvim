return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
        "williamboman/mason-lspconfig.nvim", -- to get installed servers
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		local on_attach = function(_, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }

			opts.desc = "Show LSP references"
			keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

			opts.desc = "Open available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Show hover information"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Show signature help"
			keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

			opts.desc = "Rename symbol"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>bD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>lD", vim.diagnostic.open_float, opts)

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

			opts.desc = "Manual LSP restart"
			keymap.set("n", "<leader>lR", ":LspRestart<CR>", opts)
		end

		-- for autocompletion (assing to every lsp server)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- change diagnostic symbols (located in gutter, weird symbols by default)
		local signs = { Error = "×", Warn = "!", Hint = "?", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- setup servers

		-- for each other server set capabilities and attach on_attach
		-- keep in mind that we dont want to define the servers again
		-- (i.e. only take those installed by mason-lspconfig)
		for _, server in pairs(require("mason-lspconfig").get_installed_servers()) do
			local config = {
				capabilities = capabilities,
				on_attach = on_attach,
			}
			if server == "intelephense" then
				config.settings = {
					intelephense = {
						files = { maxSize = 5000000 },
					},
				}
			end
			lspconfig[server].setup(config)
		end
	end,
}
