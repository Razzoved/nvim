return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
            current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 200,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
		})

		vim.keymap.set("n", "<leader>gsp", ":Gitsigns preview_hunk<CR>", {})
		vim.keymap.set("n", "<leader>gsb", ":Gitsigns toggle_current_line_blame<CR>", {})
	end,
}
