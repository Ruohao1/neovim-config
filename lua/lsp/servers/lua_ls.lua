local root = require("lsp.root")

return {
	root_dir = root.make_root_dir({
		markers = root.default_markers,
		allow_single_file = true,
	}),
	init_options = {
		settings = {
			-- Control via none-ls
			lint = { enable = false },
			format = { enable = false },
		},
	},
}
