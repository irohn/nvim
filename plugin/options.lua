options = {
  number = true,
  relativenumber = true,

  -- preview substitutions
  inccommand = "split",

  -- search options
  smartcase = true,
  ignorecase = true,

  -- split options
  splitbelow = true,
  splitright = true,

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

  -- update times and timeouts
  updatetime = 250,
  timeoutlen = 500,

  -- wrap long lines at words
  linebreak = true,

  -- enable mouse mode
  mouse = "a",

  -- keep signcolumn on by default
  signcolumn = 'yes',

  -- completion
  completeopt = 'menuone,noselect,noinsert',
  pumheight = 15,
}

for option, value in pairs(options, opt_type) do
  opt_type = opt_type or vim.opt
  opt_type[option] = value
end

-- vim: ts=2 sts=2 sw=2 et
