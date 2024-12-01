options = {
  number = true,
  relativenumber = true,

  -- preview substitutions
  inccommand = "split",

  -- search options
  smartcase = true,
  ignorecase = true,

  -- change tabs into spaces on save
  expandtab = true,

  -- highlight line cursor is on
  cursorline = true,

  -- persistent undo
  undofile = true,

  -- allow virtual visualization in block mode
  virtualedit = "block",

  -- show a single status line
  laststatus = 3,

  -- faster update time
  updatetime = 250,
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

-- vim: ts=2 sts=2 sw=2 et
