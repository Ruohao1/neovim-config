local M = {}

M.servers = function()
  local lsp_dir = vim.fn.stdpath("config") .. "/lua/lsp/servers/"
  local lsp_servers = {}

  if vim.fn.isdirectory(lsp_dir) == 1 then
    for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
      if file:match("%.lua$") and file ~= "init.lua" then
        local server_name = file:gsub("%.lua$", "")
        table.insert(lsp_servers, server_name)
      end
    end
  end
  vim.print(lsp_servers)
  return lsp_servers
end

M.setup = function()
  local lsp_servers = M.servers()

  local ok, mason_lsp = pcall(require, "mason-lspconfig")
  if ok then
    mason_lsp.setup({
      ensure_installed = lsp_servers,
    })
  end

  for _, server in ipairs(lsp_servers) do
    local config = require("lsp.servers." .. server)
    vim.lsp.config(server, config)
  end

  vim.lsp.enable(lsp_servers)
end

return M
