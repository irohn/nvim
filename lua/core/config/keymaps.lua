local settings = require("core.modules.settings")
local mappings = require("core.modules.mappings")

-- better indent / dedent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- terminal mappings
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", { desc = "copy normal c-w" })

-- toggle options
vim.keymap.set("n", "<leader>|", function()
  settings.option_toggle("colorcolumn", "80", "0")
end, { desc = "Toggle color column" })

vim.keymap.set("n", "<leader>#", function()
  settings.option_toggle("number", true, false)
  settings.option_toggle("relativenumber", true, false)
end, { desc = "Toggle numbers" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

