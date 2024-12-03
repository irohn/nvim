return {
  "stevearc/oil.nvim",
  ---@module "oil"
  ---@type oil.SetupOpts
  config = function()
    require("oil").setup({
      win_options = {
        signcolumn = "yes:3",
        number = false,
        relativenumber = false,
      },
    })

    local function cc(cmd, callback, opts)
      local options = { nargs = "?", complete = "dir" }
      if opts then
        options = vim.tbl_extent("force", options, opts)
      end
      vim.api.nvim_create_user_command(cmd, callback, options)
    end

    cc("Explore", function() vim.cmd("Oil") end)
    cc("Ex", function() vim.cmd("Oil") end)
    cc("Sexplore", function() vim.cmd("split | Oil") end)
    cc("Vexplore", function() vim.cmd("vsplit | Oil") end)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
