local colors = require("theme.colors")
local colorscheme = colors.colorscheme.name
local fallback_colorscheme = colors.colorscheme.fallback

local status, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status then
  print("Couldn't find colorscheme " ..
        colorscheme ..
        " falling back to " ..
        fallback_colorscheme)
  vim.cmd.colorscheme(fallback_colorscheme)
end

