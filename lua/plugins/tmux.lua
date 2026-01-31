return {
	{
		"aserowy/tmux.nvim",
		opts = {
			copy_sync = {
				-- enables copy sync. by default, all registers are synchronized.
				-- to control which registers are synced, see the `sync_*` options.
				enable = true,

				-- ignore specific tmux buffers e.g. buffer0 = true to ignore the
				-- first buffer or named_buffer_name = true to ignore a named tmux
				-- buffer with name named_buffer_name :)
				ignore_buffers = { empty = false },

				-- TMUX >= 3.2: all yanks (and deletes) will get redirected to system
				-- clipboard by tmux
				redirect_to_clipboard = false,

				-- offset controls where register sync starts
				-- e.g. offset 2 lets registers 0 and 1 untouched
				register_offset = 0,

				-- overwrites vim.g.clipboard to redirect * and + to the system
				-- clipboard using tmux. If you sync your system clipboard without tmux,
				-- disable this option!
				sync_clipboard = true,

				-- synchronizes registers *, +, unnamed, and 0 till 9 with tmux buffers.
				sync_registers = true,

				-- synchronizes registers when pressing p and P.
				sync_registers_keymap_put = true,

				-- synchronizes registers when pressing (C-r) and ".
				sync_registers_keymap_reg = true,

				-- syncs deletes with tmux clipboard as well, it is adviced to
				-- do so. Nvim does not allow syncing registers 0 and 1 without
				-- overwriting the unnamed register. Thus, ddp would not be possible.
				sync_deletes = true,

				-- syncs the unnamed register with the first buffer entry from tmux.
				sync_unnamed = true,
			},
			navigation = {
				-- cycles to opposite pane while navigating into the border
				cycle_navigation = false,

				-- enables default keybindings (C-hjkl) for normal mode
				enable_default_keybindings = false,

				-- prevents unzoom tmux when navigating beyond vim border
				persist_zoom = false,
			},
			resize = {
				-- enables default keybindings (A-hjkl) for normal mode
				enable_default_keybindings = false,

				-- sets resize steps for x axis
				resize_step_x = 1,

				-- sets resize steps for y axis
				resize_step_y = 1,
			},
			swap = {
				-- cycles to opposite pane while navigating into the border
				cycle_navigation = false,

				-- enables default keybindings (C-A-hjkl) for normal mode
				enable_default_keybindings = false,
			},
		},
		config = function(_, plugin_opts)
			local tmux = require("tmux")
			tmux.setup(plugin_opts)

			local map = vim.keymap.set
			local o = { noremap = true, silent = true }

			-- NAVIGATION (Alt+h/j/k/l) + window next/prev (Alt+n/p)
			map({ "n", "t" }, "<M-h>", tmux.move_left, o)
			map({ "n", "t" }, "<M-j>", tmux.move_bottom, o)
			map({ "n", "t" }, "<M-k>", tmux.move_top, o)
			map({ "n", "t" }, "<M-l>", tmux.move_right, o)
			map({ "n", "t" }, "<M-n>", tmux.next_window, o)
			map({ "n", "t" }, "<M-p>", tmux.previous_window, o)

			-- RESIZE (Ctrl+h/j/k/l)
			map({ "n", "t" }, "<C-h>", tmux.resize_left, o)
			map({ "n", "t" }, "<C-j>", tmux.resize_bottom, o)
			map({ "n", "t" }, "<C-k>", tmux.resize_top, o)
			map({ "n", "t" }, "<C-l>", tmux.resize_right, o)

			-- SWAP (Ctrl+Alt+h/j/k/l)  => <C-M-h> etc
			map({ "n", "t" }, "<C-M-h>", tmux.swap_left, o)
			map({ "n", "t" }, "<C-M-j>", tmux.swap_bottom, o)
			map({ "n", "t" }, "<C-M-k>", tmux.swap_top, o)
			map({ "n", "t" }, "<C-M-l>", tmux.swap_right, o)
		end,
	},
}
