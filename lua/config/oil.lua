local oil = require("oil")
local detail = false

local function find_git_root()
	local current_dir = vim.fn.expand("%:p:h")
	local git_root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(current_dir) .. " rev-parse --show-toplevel")[1]
	return vim.v.shell_error == 0 and git_root or nil
end

function _G.get_oil_winbar()
	local project_root = find_git_root() or vim.fn.getcwd()
	local dir = require("oil").get_current_dir()
	local result
	if dir then
		if dir:find(project_root, 1, true) == 1 then
			local root_name = vim.fn.fnamemodify(project_root, ":t")
			local relative_path = dir:sub(#project_root + 1)
			result = root_name .. relative_path
		else
			result =  dir
		end
	else
		-- If there is no current directory (e.g. over ssh), just show the buffer name
		result = vim.api.nvim_buf_get_name(0)
	end
	-- Center the result
	local width = vim.api.nvim_win_get_width(0)
	local padding = math.max(0, (width - #result) / 2)
	return string.rep(" ", math.floor(padding)) .. result
end

local options = {
	skip_confirm_for_simple_edits = true,
	win_options = {
		winbar = "%!v:lua.get_oil_winbar()",
		signcolumn = "yes",
		number = false,
		relativenumber = false,
	},
	keymaps = {
		["gr"] = {
			desc = "Go to project's root",
			callback = function()
				local project_root = find_git_root() or vim.fn.getcwd()
				oil.open(project_root)
			end
		},
		["gd"] = {
			desc = "Toggle file detail view",
			callback = function()
				detail = not detail
				if detail then
					require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
				else
					require("oil").set_columns({ "icon" })
				end
			end,
		},
	},
}

oil.setup(options)

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
