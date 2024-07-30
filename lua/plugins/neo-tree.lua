return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	config = function()
		require("neo-tree").setup({
			-- behavior and apppearance
			close_if_last_window = true,
			popup_border_style = "rounded",
            window = {
                position = "float",
            },

            -- defines settings for sources
			sources = { "filesystem", "document_symbols" },
			filesystem = {
				follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },

			},
            document_symbols = {
                follow_cursor = true,
            },
		})

        -- keybinds
		vim.keymap.set("n", "<C-s>", ":Neotree close<CR>")
		vim.keymap.set("n", "<C-n>", ":Neotree source=filesystem reveal=true position=right<CR>")
		vim.keymap.set("n", "<leader>fs", ":Neotree document_symbols position=float<CR>")
	end,
}
