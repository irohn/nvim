local map = vim.keymap.set

-- better up/down (taken from lazyvim)
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- clear search with esc
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- marks
map("n", "<leader>cm", function()
  vim.cmd("delm! | delm A-Z0-9 | wshada!")
  print("Marks removed!")
end, { desc = "Clear all marks" })

-- toggle options
local function vim_opt_toggle(option, on_value, off_value)
  local message = option
  local opt_value

  if type(vim.opt[option]:get()) == "table" then
    opt_value = vim.opt[option]:get()[1]
  else
    opt_value = vim.opt[option]:get()
  end

  if opt_value == off_value then
    vim.opt[option] = on_value
    message = message .. " enabled"
  else
    vim.opt[option] = off_value
    message = message .. " disabled"
  end
  print(message)
end

map("n", "<leader>|", function()
  vim_opt_toggle("colorcolumn", "80", "0")
end, { desc = "Toggle color column" })

