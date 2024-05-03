-- set local options
vim.opt_local.expandtab = true
vim.opt_local.smarttab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2

vim.keymap.set("n", "<leader>x", function()
  vim.cmd("w | source %")
end, { buffer = true, desc = "execute lua file" })

