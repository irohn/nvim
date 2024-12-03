return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim"
  },
  config = function()
    require("telescope").setup()
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fd", function() builtin.find_files({ cwd = utils.buffer_dir() }) end, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

    vim.keymap.set("n", "<leader>fb", function()
      builtin.buffers({
        sort_mru = true,
        initial_mode = "normal",
      })
    end, {})

    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 4,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily find in current buffer" })

    vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits" })
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git Branches" })

    vim.keymap.set("n", "<leader>j", function()
      builtin.jumplist({ initial_mode = "normal" })
    end, { desc = "Jumplist" })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
