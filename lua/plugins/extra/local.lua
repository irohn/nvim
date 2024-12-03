local function load_plugin(spec)
  if spec.dir then
    local expanded_dir = vim.fn.expand(spec.dir)
    if vim.fn.isdirectory(expanded_dir) ~= 1 then
      print("Warning: Directory not found for plugin '" .. spec.name .. "': " .. expanded_dir)
      return nil
    end
  end

  return spec
end

local plugins = {
  {
    name = "wormhole",
    dir = "~/projects/personal/wormhole.nvim",
    config = true,
    dev = true,
  },
}

local M = {}

for _, plugin in ipairs(plugins) do
  local loaded_plugin = load_plugin(plugin)
  if loaded_plugin then
    table.insert(M, loaded_plugin)
  end
end

return M
