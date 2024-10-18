local opt = vim.opt

-- Overwrite tab length
local tab_len = 2

opt.tabstop = tab_len
opt.softtabstop = tab_len
opt.shiftwidth = tab_len

vim.keymap.set("n", "<leader>w", "<cmd>w | source % <cr>")
