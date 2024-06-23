-- prepend name to group to avoid conflicts with plugins
local function augroup(name)
  return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- create directory on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

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

vim.api.nvim_create_user_command("MarksClear", function()
  vim.cmd("delm! | delm A-Z0-9 | wshada!")
  print("Marks cleared.")
end, { desc = "Clear all marks" })
