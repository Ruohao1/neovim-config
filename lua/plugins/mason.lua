-- https://mason-registry.dev/registry/list
local PACKAGES = {
	-- Format
	"stylua",
	-- Lint
	"ruff",
}

return {
	{
		-- Install LSP servers and 3rd-party tools
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
	{
		-- Install and upgrade 3rd-party tools managed by mason.nvim
		-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = PACKAGES,
			integrations = {
				["mason-lspconfig"] = true,
				["mason-null-ls"] = false,
				["mason-nvim-dap"] = false,
			},

			dependencies = {
				"mason-org/mason.nvim",
				"mason-org/mason-lspconfig.nvim",
			},
		},
	},
}
