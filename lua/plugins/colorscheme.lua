local colorscheme = "carbonfox"
local fallback_colorscheme = "desert"

return {

  { "EdenEast/nightfox.nvim" } ,

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()

      local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
      if not status_ok then
        print("colorscheme " .. colorscheme .. " not found, falling back to " .. fallback_colorscheme)
        vim.cmd.colorscheme(fallback_colorscheme)
      end
    end,
  },

}

