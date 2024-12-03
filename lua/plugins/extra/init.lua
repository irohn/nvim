return {

  -- mini.nvim collection
  {
    "echasnovski/mini.nvim", version = "*", config = function()
      -- text alignment plugin
      require("mini.align").setup()
      -- icon provider (requires patched font)
      require("mini.icons").setup()
      -- auto pair common characters
      require("mini.pairs").setup()
    end
  },

}
