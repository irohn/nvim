return {
  {
    'stevearc/oil.nvim',
    opts = {},
    config = function()
      local oil = require("oil")

      oil.setup({
        win_options = {
          number = false,
          relativenumber = false,
        },

        float = {
          padding = 5,
          max_width = 100,
        },
      })

      vim.keymap.set("n", "<C-n>", function()
        local git_path = vim.fn.fnamemodify(vim.fn.finddir(".git", ".;"), ":h")
        oil.toggle_float(git_path)
      end, { noremap = true, silent = true, desc = "Toggle file [E]xplorer as a buffer" })

      vim.keymap.set("n", "<C-S-n>", function()
        oil.toggle_float()
      end, { noremap = true, silent = true, desc = "Toggle file explorer in file path" })

    end,
  },
}

