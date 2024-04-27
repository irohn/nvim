--[[
  TODO:
    Add Mason support for non NixOS systems
--]]


local mason_enabled
if vim.g.osinfo.id == "nixos" then
  mason_enabled = false
else
  mason_enabled = true
end

if mason_enabled then
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

  LSP_dependencies = {
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
  }
else
  LSP_dependencies = {}
end

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      if not mason_enabled then
        local lspconfig = require("lspconfig")

        local lsp_handler = function(server_name, lspconfig_name, server_opts)
          lspconfig_name = lspconfig_name or server_name
          server_opts = server_opts or {}
          local exit_code = vim.system({"which", server_name}):wait()["code"]
          if exit_code == 0 then
            lspconfig[lspconfig_name].setup(server_opts)
          else
            print(server_name .. "not found.")
            vim.health.warn(server_name .. "not found",
              {"Try installing " .. server_name .. " with your package manager."},
              {"Make sure " .. server_name .. "is in PATH."})
          end
        end

        lsp_handler("lua-language-server", "lua_ls", {
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


      end
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

  LSP_dependencies,

  {
    "folke/neodev.nvim",
    opts = {},
  },
}
