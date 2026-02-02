return {
	"vimpostor/vim-tpipeline",
	event = { "VeryLazy" }, -- No flickring
	config = function()
		local aug = vim.api.nvim_create_augroup("TpipelineFix", { clear = true })

		local function fix()
			vim.opt.laststatus = 0
			pcall(function()
				vim.fn["tpipeline#update"]()
			end)
		end

		vim.keymap.set("n", "<leader>ms", function()
			fix()
			-- redraw UI
		end, { desc = "UI: refresh tpipeline / hide statusline" })

		vim.api.nvim_create_autocmd({
			"VimEnter",
			"FocusGained",
			"VimResized",
			"WinEnter",
			"BufEnter",
		}, {
			group = aug,
			callback = fix,
		})

		-- The nuclear option: if *anything* changes laststatus, force it back.
		vim.api.nvim_create_autocmd("OptionSet", {
			group = aug,
			pattern = "laststatus",
			callback = fix,
		})
	end,
}
