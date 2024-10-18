local tab_len = 2

vim.opt_local.tabstop = tab_len
vim.opt_local.softtabstop = tab_len
vim.opt_local.shiftwidth = tab_len

vim.keymap.set("n", "<leader>w", "<cmd>w | source % <cr>", { desc = "source current file" })
