return {
  "mbbill/undotree",
  config = function()
    vim.cmd[[
    let g:undotree_WindowLayout = 2
    let g:undotree_SetFocusWhenToggle = 1
    ]]
    vim.keymap.set("n", "<s-u>", vim.cmd.UndotreeToggle,
    { silent = true, noremap = true, desc = "undo tree" })
  end
}

-- vim: ts=2 sts=2 sw=2 et
