local colorscheme = "carbonfox"
local fallback_colorscheme = "retrobox"

local status, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status then
  print("Couldn't find colorscheme " ..
        colorscheme ..
        " falling back to " ..
        fallback_colorscheme)
  vim.cmd.colorscheme(fallback_colorscheme)
  vim.cmd("hi Normal guibg=NONE ctermbg=NONE") -- remove background
end

