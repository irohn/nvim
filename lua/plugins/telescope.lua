return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
    },
    config = function()
      require("telescope").setup({
        defaults = {
        },
        pickers = {
          colorscheme = {
            enable_preview = true
          },
          find_files = {
            hidden = true,
            file_ignore_patterns = { ".git/" },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind [G]rep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })

      vim.keymap.set("n", "<leader>/", function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
          prompt_title = "Find in buffer",
          previewer = false,
        })
      end, { desc = "[/] Fuzzily search in current buffer" })

      vim.keymap.set("n", "<leader>f/", function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        }
      end, { desc = "[F]ind [/] in Open Files" })

      vim.keymap.set("n", "<leader>fn", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "[F]ind [N]eovim files" })

      vim.keymap.set("n", "<leader>th", "<cmd>Telescope colorscheme<cr>", { desc = "Change color [T][H]eme" })

    end,
  }
}

