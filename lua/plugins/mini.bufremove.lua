return {
	{
		"nvim-mini/mini.bufremove",
		version = "*",
		opts = {},
		config = function(_, opts)
			local bufremove = require("mini.bufremove")
			bufremove.setup(opts)

			local map = vim.keymap.set
			map("n", "<leader>bd", function()
				bufremove.delete(0, false)
			end, { desc = "Delete Current Buffer" })
			-- Delete every buffer except the current one
			map("n", "<leader>bo", function()
				bufremove.delete({ vim.fn.bufnr("%", true) }, false)
			end, { desc = "Delete Other Buffers" })
		end,
	},
}
