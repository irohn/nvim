local M = {}

function M.keymap(mode, lhs, rhs, opts)
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

-- Read the cached state from the file
local function read_state_from_cache()
  local cache_file = vim.fn.stdpath("data") .. "/extra_plugins_state"
  local file = io.open(cache_file, "r")
  if not file then
    return false -- Default to extra plugins being disabled
  end
  local content = file:read("*a")
  file:close()
  return content == "enabled"
end

-- Write the current state to the cache file
local function write_state_to_cache(state)
  local cache_file = vim.fn.stdpath("data") .. "/extra_plugins_state"
  local file = io.open(cache_file, "w")
  if not file then
    vim.notify("Failed to write to cache file: " .. cache_file, vim.log.levels.ERROR)
    return
  end
  file:write(state)
  file:close()
end

-- Define the utils.extra function
function M.extra()
  local plugins_enabled = read_state_from_cache()

  -- Create user commands
  vim.api.nvim_create_user_command("ExtraPluginsEnable", function()
    plugins_enabled = true
    write_state_to_cache("enabled")
    vim.notify("Extra plugins enabled. Restart Neovim to apply changes.", vim.log.levels.INFO)
  end, {})

  vim.api.nvim_create_user_command("ExtraPluginsDisable", function()
    plugins_enabled = false
    write_state_to_cache("disabled")
    vim.notify("Extra plugins disabled. Restart Neovim to apply changes.", vim.log.levels.INFO)
  end, {})

  return plugins_enabled
end

return M

-- vim: ts=2 sts=2 sw=2 et
