return {
	{
		-- Install LSP package manager
		-- https://github.com/mason-org/mason.nvim
		"mason-org/mason.nvim",
		opts = {
			ui = {
				border = "single",
				height = 0.8,
				width = 0.8,
			},
		},
		event = { "VeryLazy" },
	},
	{
		-- Bridge between mason.nvim and lspconfig
		-- https://github.com/mason-org/mason-lspconfig.nvim
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}
