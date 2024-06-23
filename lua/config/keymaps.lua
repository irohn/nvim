local set = vim.keymap.set

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
set("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "no highlight on esc" })

-- stay in visual mode after indent / dedent
set("v", "<", "<gv")
set("v", ">", ">gv")

-- center screen on half page jumps
set("n", "<C-u>", "<C-u>zz")
set("n", "<C-d>", "<C-d>zz")

-- terminal
set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })
set("t", "<C-w>", "<C-\\><C-n><C-w>", { desc = "Exit terminal mode and insert C-w" })

-- toggle options
set("n", "<leader>|", function()
  toggle("colorcolumn", "80", "0")
end, { desc = "Toggle color column" })

set("n", "<leader>#", function()
  toggle("number", true, false)
  toggle("relativenumber", true, false)
end, { desc = "Toggle numbers" })
