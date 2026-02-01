return {
	{ "neovim/nvim-lspconfig" },

	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",

				"pyright",
				"ruff",

				"gopls",
				"rust_analyzer",

				"clangd",

				"ts_ls",
				"html",
				"cssls",
				"jsonls",
				"yamlls",
			},
		},
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp")
			-- local util = require("lspconfig.util")
			--
			-- vim.lsp.config("pyright", {
			-- 	root_dir = util.root_pattern(
			-- 		".venv",
			-- 		"pyproject.toml",
			-- 		"requirements.txt",
			-- 		".git",
			-- 		"setup.py",
			-- 		"setup.cfg"
			-- 	),
			-- 	settings = {
			-- 		python = {
			-- 			analysis = {
			-- 				autoSearchPaths = true,
			-- 				diagnosticMode = "openFilesOnly",
			-- 				useLibraryCodeForTypes = true,
			-- 				reportUnusedImport = "none",
			-- 			},
			-- 		},
			-- 	},
			-- })
		end,
	},
}
