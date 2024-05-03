-- set local options
vim.opt_local.expandtab = true
vim.opt_local.smarttab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

vim.keymap.set("n", "<leader>x", function()
  local file_name = vim.api.nvim_buf_get_name(0)
  vim.cmd.write({ file_name, bang = true, mods = { silent = true } }) -- save file

  -- ("i" to enter insert before typing rest of the command, then <C-\\><C-n> + <c-w><c-p> to go to previous buffer)
  local py_cmd = vim.api.nvim_replace_termcodes("i/usr/bin/env python \"" .. file_name .. "\"<CR><C-\\><C-n>", true, false, true)

  -- Determine terminal window split and launch terminal
  local percent_of_win = 0.4
  local curr_win_height = vim.api.nvim_win_get_height(0) -- Current window height
  local term_height = math.floor(curr_win_height * percent_of_win) -- Terminal height

  vim.cmd("below " .. term_height .. "split | term") -- Launch terminal (horizontal split)

  vim.api.nvim_feedkeys(py_cmd, "t", false)

end, { buffer = true, desc = "execute python file" })

