local tab_len = 4

vim.opt_local.shiftwidth = tab_len
vim.opt_local.softtabstop = tab_len
vim.opt_local.tabstop = tab_len

vim.keymap.set("n", "<leader>w", "<cmd>w | !bash -c ./% <cr>", { desc = "run bash file" })
