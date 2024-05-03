-- prepend "irohn_" to group names to avoid conflicts
local function augroup(name)
  return vim.api.nvim_create_augroup("irohn_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
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
  group = augroup("terminal_buffer_options"),
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
