local M = {}

M.keymap = function(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true,
  }
  
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  local function set_keymap(mode, l, r, options)
    vim.keymap.set(mode, l, r, options)
  end

  if type(lhs) == "table" then
    for _, l in ipairs(lhs) do
      set_keymap(mode, l, rhs, options)
    end
  else
    set_keymap(mode, lhs, rhs, options)
  end
end

return M
