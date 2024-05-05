local toggle = function(option, on_value, off_value)
  local opt_value
  local message

  if type(vim.opt[option]:get()) == "table" then
    opt_value = vim.opt[option]:get()[1]
  else
    opt_value = vim.opt[option]:get()
  end

  if opt_value == off_value then
    vim.opt[option] = on_value
    message = option .. " enabled"
  else
    vim.opt[option] = off_value
    message = option .. " disabled"
  end
  print(message)
end

-- clear search with esc
vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "no highlight on esc" })

-- stay in visual mode after indent / dedent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>", { desc = "Exit terminal mode and insert C-w" })

-- toggle options
vim.keymap.set("n", "<leader>|", function()
  toggle("colorcolumn", "80", "0")
end, { desc = "Toggle color column" })

vim.keymap.set("n", "<leader>#", function()
  toggle("number", true, false)
  toggle("relativenumber", true, false)
end, { desc = "Toggle numbers" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

