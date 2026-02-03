return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvimtools/none-ls-extras.nvim", "gbprod/none-ls-shellcheck.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local null_ls = require("null-ls")

			-- Helpers to only enable formatters when you want
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics
			local code_actions = null_ls.builtins.code_actions

			null_ls.setup({
				debug = false,

				sources = {
					-- Formatting
					-- formatting.prettier, -- js/ts/json/yaml/md
					-- formatting.stylua, -- lua
					-- formatting.shfmt, -- shell scripts
					-- formatting.black, -- python (optional; many prefer ruff format instead)
					-- formatting.ruff_format,  -- python (if available in your builtins)

					-- Diagnostics (lint)
					-- require("none-ls.diagnostics.ruff"),
					-- require("none-ls.diagnostics.eslint_d"),
					-- require("none-ls-shellcheck.diagnostics"),

					-- Code actions
					-- code_actions.gitsigns, -- git hunks actions (optional)
					-- require("none-ls.code_actions.eslint_d"),
					-- require("none-ls-shellcheck.code_actions"),
				},

				-- If you want none-ls to handle formatting on save:
				-- on_attach = function(client, bufnr)
				-- 	if client.supports_method("textDocument/formatting") then
				-- 		local group = vim.api.nvim_create_augroup("NoneLsFormat", { clear = false })
				-- 		vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
				-- 		vim.api.nvim_create_autocmd("BufWritePre", {
				-- 			group = group,
				-- 			buffer = bufnr,
				-- 			callback = function()
				-- 				vim.lsp.buf.format({
				-- 					bufnr = bufnr,
				-- 					filter = function(c)
				-- 						return c.name == "null-ls"
				-- 					end,
				-- 				})
				-- 			end,
				-- 		})
				-- 	end
				-- end,
			})
		end,
	},
}
