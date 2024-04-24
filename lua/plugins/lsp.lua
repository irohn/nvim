return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- servers
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              disable = { "missing-fields" },
              globals = { "vim" },
            },
          },
        },
      })

      -- keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = args.buf })
          vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { buffer = args.buf })
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = args.buf })
          vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = args.buf })
        end,
      })
    end,
  },

  {
    "folke/neodev.nvim",
    opts = {},
  },
}

