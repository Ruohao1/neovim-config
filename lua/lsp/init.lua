local M = {}

local servers = {
	"pyright",
	"lua_ls",
}

function M.setup()
	require("lsp.diagnostics").setup()

	local on_attach = require("lsp.attach").on_attach
	local root = require("lsp.root")

	-- Base opts applied to every server unless overridden
	local base = {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	}

	local ok_mason, mason_lspconfig = pcall(require, "mason-lspconfig")
	if ok_mason then
		mason_lspconfig.setup({
			ensure_installed = servers,
			automatic_installation = false,
		})
	end

	for _, name in ipairs(servers) do
		local ok, mod = pcall(require, ("lsp.servers.%s"):format(name))
		if not ok then
			vim.notify(("LSP: missing module lsp.servers.%s"):format(name), vim.log.levels.WARN)
			mod = {}
		end

		local server_opts = type(mod) == "function" and mod(base) or (mod.opts or mod)

		-- If a server module doesn’t set root_dir, apply a robust default.
		if server_opts.root_dir == nil then
			server_opts.root_dir = root.make_root_dir({
				markers = root.default_markers,
				-- Decide whether this server should attach in single-file mode:
				-- true: attach even if no project root found
				-- false: require a project root
				allow_single_file = true,
			})
		end

		local opts = vim.tbl_deep_extend("force", {}, base, server_opts)
		vim.lsp.config[name] = opts
	end
end

return M
