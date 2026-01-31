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
					{ mode = "n", keys = "d" },
					{ mode = "n", keys = "c" },
					{ mode = "n", keys = "y" },

					{ mode = "o", keys = "i" },
					{ mode = "o", keys = "a" },
					{ mode = "x", keys = "i" },
					{ mode = "x", keys = "a" },

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

					-- Around
					{ mode = "o", keys = "a", desc = "+Around textobject" },
					{ mode = "o", keys = "aq", desc = "Quote" },
					{ mode = "o", keys = "ab", desc = "Brackets" },
					{ mode = "o", keys = "ap", desc = "Paragraph" },
					{ mode = "o", keys = "at", desc = "Tag" },
					{ mode = "o", keys = "af", desc = "Function" },
					{ mode = "o", keys = "aa", desc = "Argument" },
					{ mode = "o", keys = "a.", desc = "Punctuation" },
					{ mode = "o", keys = "a1", desc = "Digit" },
					{ mode = "o", keys = "a?", desc = "Prompted object" },

					-- Inside
					{ mode = "o", keys = "i", desc = "+Inside textobject" },
					{ mode = "o", keys = "iq", desc = "Quote" },
					{ mode = "o", keys = "ib", desc = "Brackets" },
					{ mode = "o", keys = "ip", desc = "Paragraph" },
					{ mode = "o", keys = "it", desc = "Tag" },
					{ mode = "o", keys = "if", desc = "Function" },
					{ mode = "o", keys = "ia", desc = "Argument" },
					{ mode = "o", keys = "i.", desc = "Punctuation" },
					{ mode = "o", keys = "i1", desc = "Digit" },
					{ mode = "o", keys = "i?", desc = "Prompted object" },

					-- Same set for visual selections
					{ mode = "x", keys = "a", desc = "+Around textobject" },
					{ mode = "x", keys = "aq", desc = "Quote" },
					{ mode = "x", keys = "ab", desc = "Brackets" },
					{ mode = "x", keys = "ap", desc = "Paragraph" },
					{ mode = "x", keys = "at", desc = "Tag" },
					{ mode = "x", keys = "af", desc = "Function" },
					{ mode = "x", keys = "aa", desc = "Argument" },
					{ mode = "x", keys = "a.", desc = "Punctuation" },
					{ mode = "x", keys = "a1", desc = "Digit" },
					{ mode = "x", keys = "a?", desc = "Prompted object" },

					{ mode = "x", keys = "i", desc = "+Inside textobject" },
					{ mode = "x", keys = "iq", desc = "Quote" },
					{ mode = "x", keys = "ib", desc = "Brackets" },
					{ mode = "x", keys = "ip", desc = "Paragraph" },
					{ mode = "x", keys = "it", desc = "Tag" },
					{ mode = "x", keys = "if", desc = "Function" },
					{ mode = "x", keys = "ia", desc = "Argument" },
					{ mode = "x", keys = "i.", desc = "Punctuation" },
					{ mode = "x", keys = "i1", desc = "Digit" },
					{ mode = "x", keys = "i?", desc = "Prompted object" },

					-- Operators (optional nice-to-have)
					{ mode = "n", keys = "d", desc = "+Delete" },
					{ mode = "n", keys = "dd", desc = "Line" },
					{ mode = "n", keys = "c", desc = "+Change" },
					{ mode = "n", keys = "cc", desc = "Line" },
					{ mode = "n", keys = "y", desc = "+Yank" },
					{ mode = "n", keys = "yy", desc = "Line" },

					{ mode = "n", keys = "gc", desc = "+Comment" },
					{ mode = "n", keys = "gcc", desc = "Line" },
					{ mode = "v", keys = "gc", desc = "+Inside textobject" },
					{ mode = "v", keys = "gca", desc = "+Around textobject" },
				},

				window = {
					-- Nice compact floating window
					config = {
						border = "single",
					},
					delay = 220,
					scroll_down = "<C-d>",
					scroll_up = "<C-D>",
				},
			})
		end,
	},
}
