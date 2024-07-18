require "nvchad.mappings"

-- prepend name to group to avoid conflicts with plugins
local function augroup(name)
  return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

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


local nomap = vim.keymap.del
local map = vim.keymap.set

-- remove nvchad's conflicting mapping
nomap("n", "<TAB>")

-- set custom mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- stay in visual mode after indent / dedent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- center screen on half page jumps
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- terminal
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })
map("t", "<C-w>", "<C-\\><C-n><C-w>", { desc = "Exit terminal mode and insert C-w" })

-- toggle options
map("n", "<leader>|", function()
  toggle("colorcolumn", "80", "0")
end, { desc = "Toggle color column" })

map("n", "<leader>#", function()
  toggle("number", true, false)
  toggle("relativenumber", true, false)
end, { desc = "Toggle numbers" })

-- set terminal buffers options and keymaps
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = augroup("terminal_options"),
  pattern = "term://*",
  callback = function(event)
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.cmd.startinsert()
  end,
})

