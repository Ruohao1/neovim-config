return {
	{
		"olimorris/codecompanion.nvim",
		version = "^18.0.0",
		opts = {
			interactions = {
				chat = {
					keymaps = {
						clear = false,
					},
				},
			},
		},
		config = function(_, opts)
			require("codecompagnion").setup(opts)
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
