return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- settings
			vim.diagnostic.config({ update_in_insert = true })

			-- diagnostic
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>td", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				end,
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		lazy = false,
		config = function()
			local lsp = require("cmp_nvim_lsp")
			local capabilities = lsp.default_capabilities()
			require("mason-lspconfig").setup({
				ensure_installed = {
                    --[[ COMPILED LANGUAGES ]]
					"csharp_ls",
					"fsautocomplete", -- f#
                    "gopls", -- golang
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
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,
					["intelephense"] = function()
						require("lspconfig").intelephense.setup({
							capabilities = capabilities,
							settings = {
								intelephense = {
									files = { maxSize = 5000000 },
								},
							},
						})
					end,
				},
			})
		end,
	},
}
