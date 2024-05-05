return   {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    { "chentoast/marks.nvim", opts = {} },
  },
  config = function()
    local harpoon = require("harpoon")

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, require('telescope.themes').get_dropdown({
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        sorter = conf.generic_sorter({}),
        previewer = false,
        initial_mode = "normal",
      })):find()
    end

    harpoon:setup({})

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>l", function() toggle_telescope(harpoon:list()) end)

    vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)

    vim.keymap.set("n", "<A-S-p>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<A-S-n>", function() harpoon:list():next() end)

    vim.api.nvim_create_user_command("HarpoonListClear", function()
      harpoon:list():clear()
    end, { desc = "Command to clear harpoon list" })

  end,
}
