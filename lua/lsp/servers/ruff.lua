local root = require("user.lsp.root")

return {
	root_dir = root.make_root_dir({
		markers = root.default_markers,
		allow_single_file = true,
	}),

	init_options = {
		settings = {
			-- Disable in none-ls
			lint = { enable = true },
			format = { enable = true },
		},
	},
}
