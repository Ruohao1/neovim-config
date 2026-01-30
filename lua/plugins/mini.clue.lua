return {
	{
		"echasnovski/mini.clue",
		version = false, -- track latest; pin via lazy-lock.json
		event = "VeryLazy",
		config = function()
			local clue = require("mini.clue")

			clue.setup({
				-- Show “which-key style” helper after this delay (ms)
				triggers = {
					-- Leader maps
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },

					-- Built-in-ish prefixes worth discovering
					{ mode = "n", keys = "g" },
					{ mode = "n", keys = "z" },
					{ mode = "n", keys = "[" },
					{ mode = "n", keys = "]" },

					-- Optional: show window commands as you type them
					{ mode = "n", keys = "<C-w>" },

					-- Optional: show marks/registers
					-- { mode = "n", keys = "'" },
					-- { mode = "n", keys = "`" },
					-- { mode = "n", keys = '"' },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					clue.gen_clues.square_brackets(),
					clue.gen_clues.builtin_completion(),
					clue.gen_clues.g(),
					clue.gen_clues.marks(),
					clue.gen_clues.registers(),
					clue.gen_clues.windows(),
					clue.gen_clues.z(),

					{ mode = "n", keys = "<Leader>b", desc = "+Buffers" },
					{ mode = "n", keys = "<Leader>l", desc = "+LSP" },
					{ mode = "n", keys = "<Leader>g", desc = "+Git" },
					{ mode = "n", keys = "<Leader>f", desc = "+Telescope" },
					{ mode = "n", keys = "<Leader>c", desc = "+Code" },
					{ mode = "n", keys = "<Leader>w", desc = "+Windows" },
					{ mode = "n", keys = "<Leader>r", desc = "+Iron (REPL)" },
				},

				window = {
					-- Nice compact floating window
					config = {
						width = 60,
						border = "single",
					},
					delay = 220,
					scroll_down = "<C-j>",
					scroll_up = "<C-k>",
				},
			})
		end,
	},
}
