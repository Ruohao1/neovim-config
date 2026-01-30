return {
	-- TODO: bind keymaps :h oil-actions
	-- https://github.com/stevearc/oil.nvim/
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			float = {
				border = "single",
				max_width = 0.8,
				max_height = 0.8,
			},
			confirmation = {
				border = "single",
				win_options = {
					winblend = 0,
				},
			},
			keymaps = {
				["<C-i>"] = function()
					require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
				end,
				["<BS>"] = "actions.parent",
				["<Esc>"] = "actions.close",
				["<q>"] = "actions.close",
			},
		},

		config = function(_, opts)
			local oil = require("oil")
			oil.setup(opts)

			local function toggle_oil_float()
				local ft = vim.bo.filetype
				if ft == "oil" then
					-- close the oil window
					vim.cmd("close")
					return
				end
				-- open oil in a float
				oil.open_float()
			end

			vim.keymap.set("n", "<leader><Tab>", toggle_oil_float, {
				silent = true,
				desc = "Toggle Oil (float)",
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "oil",
				callback = function(ev)
					vim.keymap.set("n", "q", function()
						oil.close()
					end, { buffer = ev.buf, silent = true, desc = "Oil float" })
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "OilEnter",
				callback = vim.schedule_wrap(function(args)
					if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
						oil.open_preview()
					end
				end),
			})
		end,
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
}
