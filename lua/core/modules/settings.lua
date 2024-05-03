local M = {}

M.option_toggle = function(option, on_value, off_value)
  local opt_value

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

return M
