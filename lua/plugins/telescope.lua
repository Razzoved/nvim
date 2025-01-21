return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local telescope_actions = require("telescope.actions")
		local telescope_themes = require("telescope.themes")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = telescope_actions.move_selection_next,
						["<C-k>"] = telescope_actions.move_selection_previous,
						["<C-q>"] = telescope_actions.send_to_qflist + telescope_actions.open_qflist,
					},
				},
				file_ignore_patterns = {
					"node_modules",
					".git",
					".cache",
					"bin",
					"obj",
					"build",
					".vs",
					".vscode",
					".idea",
				},
				extensions = {
					["ui-select"] = {
						telescope_themes.get_dropdown({
							-- more opts
						}),
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find string in cwd" })
	end,
}
