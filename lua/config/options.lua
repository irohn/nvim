local opt = vim.opt

-- show substitute in split window
opt.inccommand = "split"

-- tabs & spaces
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- search
opt.smartcase = true
opt.ignorecase = true

-- line numbers
opt.number = true
opt.relativenumber = true

-- split behavior
opt.splitbelow = true
opt.splitright = true

-- sign column
opt.signcolumn = "yes"

-- sync clipboard with system
opt.clipboard = "unnamedplus"

-- format options
opt.formatoptions:remove({ "c", "r", "o" })

-- cursor
opt.cursorline = true

-- status line
opt.laststatus = 3

-- undo / redo
opt.undofile = true
opt.undolevels = 10000

-- visual mode
opt.virtualedit = "block"

-- text
opt.wrap = false

-- terminal
opt.termguicolors = true
