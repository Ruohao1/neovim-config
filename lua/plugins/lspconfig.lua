return {
	{
	  "neovim/nvim-lspconfig",
	  config = function()
      local map = vim.keymap.set

      map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
      map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
      map("n", "S", vim.lsp.buf.signature_help, { desc = "Signature Help" })

      map("n", "<Leader>li", "<Cmd>LspInfo<CR>", { desc = "LspInfo" })
      map("n", "<Leader>lr", "<Cmd>LspRestart<CR>", { desc = "LspRestart" })

      map("n", "<leader>cr", vim.lsp.buf.rename, {desc = "rename"})
      map("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "code action"})
      map("n", "<leader>cl", vim.diagnostic.setloclist, {desc = "loclist"})
    end
	},
}
