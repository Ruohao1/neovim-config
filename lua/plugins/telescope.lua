return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			-- Media preview
			{ "nvim-telescope/telescope-media-files.nvim" },
			{ "nvim-lua/popup.nvim" },
		},
		config = function()
			require("telescope").load_extension("media_files")
			require("telescope").setup({
				defaults = {
					layout_config = { prompt_position = "top" },
					sorting_strategy = "ascending",
				},
				extensions = {
					media_files = {
						-- filetypes whitelist
						-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
						filetypes = { "png", "webp", "jpg", "jpeg" },
						-- find command (defaults to `fd`)
						find_cmd = "rg",
					},
				},
			})
			local map = vim.keymap.set
			map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
			map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
			map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
			map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
			map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
		end,
	},
}
