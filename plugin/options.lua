local opt = vim.opt

-- Preview substitutions live, as you type!
opt.inccommand = "split"

-- Search options
opt.smartcase = true
opt.ignorecase = true

-- Splits options
opt.splitbelow = true
opt.splitright = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Remove end of buffer `~` symbols
opt.fillchars = { eob = " " }

-- Highlight cursor line
opt.cursorline = true
opt.cursorlineopt = "both"

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 6

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Enable 24-bit colour
opt.termguicolors = true

-- Make statusline global
opt.laststatus = 3

-- Allow going past end of lines in visual block mode
opt.virtualedit = "block"

-- Line numbers
opt.number = true
opt.relativenumber = true

opt.updatetime = 250
opt.timeoutlen = 300
