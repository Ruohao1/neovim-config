return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged_enable = true,
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},
			current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},

			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				-- Navigation
				map("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]h", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, "Next hunk")

				map("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[h", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, "Prev hunk")

				-- Actions
				map("n", "<leader>ghs", gitsigns.stage_hunk, "Stage hunk")
				map("n", "<leader>ghr", gitsigns.reset_hunk, "Reset hunk")

				map("v", "<leader>ghs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage selection")

				map("v", "<leader>ghr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset selection")

				map("n", "<leader>ghS", gitsigns.stage_buffer, "Stage buffer")
				map("n", "<leader>ghR", gitsigns.reset_buffer, "Reset buffer")
				map("n", "<leader>ghp", gitsigns.preview_hunk, "Preview hunk")
				map("n", "<leader>ghi", gitsigns.preview_hunk_inline, "Preview hunk inline")

				map("n", "<leader>gb", function()
					gitsigns.blame_line({ full = true })
				end, "Blame line (full)")

				map("n", "<leader>gd", gitsigns.diffthis, "Diff this")
				map("n", "<leader>gD", function()
					gitsigns.diffthis("~")
				end, "Diff vs ~")

				map("n", "<leader>gQ", function()
					gitsigns.setqflist("all")
				end, "Hunks -> quickfix (all buffers)")
				map("n", "<leader>gq", gitsigns.setqflist, "Hunks -> quickfix (buffer)")

				-- Toggles
				map("n", "<leader>gB", gitsigns.toggle_current_line_blame, "Toggle line blame")
				map("n", "<leader>gw", gitsigns.toggle_word_diff, "Toggle word diff")

				-- Text object
				map({ "o", "x" }, "ghg", gitsigns.select_hunk, "Select hunk")
			end,
		},
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},
}
