local M = {}

M.default_markers = {
	".git",
	".venv",
	"pyproject.toml",
	"setup.py",
	"setup.cfg",
	"requirements.txt",
	"Pipfile",
	"poetry.lock",
	"uv.lock",
	"stylua.toml",
	".luarc.json",
	".luarc.jsonc",
	"package.json",
}

local function is_fs_root(path)
	local parent = vim.fs.dirname(path)
	return parent == nil or parent == path
end

function M.make_root_dir(opts)
	opts = opts or {}
	local markers = opts.markers or M.default_markers
	local allow_single_file = opts.allow_single_file == true

	return function(fname)
		fname = fname or vim.api.nvim_buf_get_name(0)
		if fname == "" then
			return nil
		end

		local dir = vim.fs.dirname(fname)
		if not dir then
			return nil
		end

		local found = vim.fs.find(markers, { path = dir, upward = true })[1]
		if found then
			return vim.fs.dirname(found)
		end

		-- single-file mode fallback:
		if allow_single_file then
			-- use file’s directory unless it’s filesystem root (avoid attaching everywhere)
			return is_fs_root(dir) and nil or dir
		end

		return nil
	end
end

return M
