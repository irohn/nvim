local colorscheme = require("theme.colors").colorscheme
local fallback_theme = "habamax"

local status, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status then
  print("Couldn't find colorscheme " ..
        colorscheme ..
        " falling back to " ..
        fallback_theme)

  vim.cmd.colorscheme(fallback_theme)
end
