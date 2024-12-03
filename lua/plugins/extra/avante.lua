--[[
For consistency between sessions, it is recommeneded to set the environment variables of the API keys outside of neovim
for example, to use claude:
export ANTHROPIC_API_KEY=your-api-key
--]]

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  config = function()
    require("config.env")
    require("avante").setup()
  end
}

-- vim: ts=2 sts=2 sw=2 et
