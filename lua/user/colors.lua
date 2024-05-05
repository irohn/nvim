local colorscheme = "carbonfox"
local fallback_colorscheme = "wildcharm"
local transparent = true

local status, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status then
  print("Couldn't find colorscheme " ..
        colorscheme ..
        " falling back to " ..
        fallback_colorscheme)
  vim.cmd.colorscheme(fallback_colorscheme)
end

local transparent_highlight_groups = {
  "Normal",
  "EndOfBuffer",
}

if (transparent) then
  for _, hi in pairs(transparent_highlight_groups) do
    vim.cmd("hi " .. hi .. " guibg=NONE ctermbg=NONE")
  end
end


