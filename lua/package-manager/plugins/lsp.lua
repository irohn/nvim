local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          disable = { "missing-fields" },
          globals = {'vim'},
        }
      },
    },
  },
}

local tools = {
  "stylua",
}

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
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

  { "williamboman/mason.nvim", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local server = servers[server_name] or {}
          require("lspconfig")[server_name].setup(server)
        end
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason.nvim", "mason-lspconfig.nvim" },
    config = function()
      vim.list_extend(tools, vim.tbl_keys(servers or {}))
      require("mason-tool-installer").setup({
        ensure_installed = tools,
      })
    end
  },
  {
    "folke/neodev.nvim",
    opts = {},
  },
}
