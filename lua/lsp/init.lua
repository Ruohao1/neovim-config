local M = {}

local servers = {
	"pyright",
	"lua_ls",
}

function M.setup()
	require("lsp.diagnostics").setup()

	local on_attach = require("lsp.attach").on_attach
	local root = require("lsp.root")

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
	local lspconfig = require("lspconfig")

	for _, name in ipairs(servers) do
		local ok, mod = pcall(require, ("lsp.servers.%s"):format(name))
		if not ok then
			vim.notify(("LSP: missing module lsp.servers.%s"):format(name), vim.log.levels.WARN)
			mod = {}
		end

		local server_opts = type(mod) == "function" and mod(base) or (mod.opts or mod)

		if server_opts.root_dir == nil then
			server_opts.root_dir = root.make_root_dir({
				markers = root.default_markers,
				allow_single_file = true,
			})
		end

		local opts = vim.tbl_deep_extend("force", {}, base, server_opts)

		local default_cfg = lspconfig[name]
				and lspconfig[name].document_config
				and lspconfig[name].document_config.default_config
			or nil

		if not default_cfg then
			vim.notify(
				("LSP: no lspconfig default for %s (missing plugin or wrong name?)"):format(name),
				vim.log.levels.ERROR
			)
		else
			vim.lsp.config[name] = vim.tbl_deep_extend("force", {}, default_cfg, opts)
			vim.lsp.enable(name)
		end
	end
end

return M
