local M = {}

local function map(buf, mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true, desc = desc })
end

function M.on_attach(client, buf)
	-- Example: disable formatting for servers you don’t want formatting from
	-- (you’ll control formatting via your formatter layer)
	if client.name == "pyright" or client.name == "jsonls" then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end

	map(buf, "n", "gd", vim.lsp.buf.definition, "go to definition")
	map(buf, "n", "gr", vim.lsp.buf.references, "go to references")
	map(buf, "n", "K", vim.lsp.buf.hover, "hover")
	map(buf, "n", "<leader>cr", vim.lsp.buf.rename, "rename")
	map(buf, "n", "<leader>ca", vim.lsp.buf.code_action, "code action")
	map(buf, "n", "<leader>cd", vim.diagnostic.open_float, "open diagnotics")
	map(buf, "n", "<leader>cl", vim.diagnostic.setloclist, "loclist")
end

return M
