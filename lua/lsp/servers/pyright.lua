local root = require("lsp.root")

return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_dir = root.make_root_dir({
		markers = root.default_markers,
		allow_single_file = true,
	}),
	settings = {
		python = {
			analysis = {
				-- keep pyright focused on type-checking; adjust to taste
				typeCheckingMode = "basic",
			},
		},
	},
}
