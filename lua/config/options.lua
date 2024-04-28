local set = function(opts, scope)
  scope = scope or vim.opt
  for k, v in pairs(opts) do
    scope[k] = v
  end
end

local global_opts = {
  mapleader = " ",
  maplocalleader = "\\",
}

local opts = {
  clipboard = "unnamedplus", -- Sync with system clipboard
  completeopt = "menu,menuone,noselect",
  confirm = true, -- Confirm to save changes before exiting modified buffer
  cursorline = true, -- Enable highlighting of the current line
  expandtab = true, -- Use spaces instead of tabs
  ignorecase = true, -- Ignore case
  inccommand = "split", -- preview incremental substitute
  laststatus = 3, -- global statusline
  mouse = "a", -- Enable mouse mode
  number = true, -- Print line number
  relativenumber = true, -- Relative line numbers
  scrolloff = 4, -- Lines of context
  shiftround = true, -- Round indent
  shiftwidth = 4, -- Size of an indent
  sidescrolloff = 8, -- Columns of context
  signcolumn = "yes", -- Always show the signcolumn, otherwise it would shift the text each time
  smartcase = true, -- Don't ignore case with capitals
  smartindent = true, -- Insert indents automatically
  splitbelow = true, -- Put new windows below current
  splitkeep = "screen",
  tabstop = 4, -- Number of spaces tabs count for
  termguicolors = true, -- True color support
  undofile = true,
  undolevels = 10000,
  updatetime = 200, -- Save swap file and trigger CursorHold
  virtualedit = "block", -- Allow cursor to move where there is no text in visual block mode
  wildmode = "longest:full,full", -- Command-line completion mode
  winminwidth = 5, -- Minimum window width
  wrap = false, -- Disable line wrap
  colorcolumn = "0", -- disable color colum
  fillchars = { eob = " " }, -- remove the "~" char from end of buffer
  foldlevel = 99,
}

if vim.fn.has("nvim-0.10") == 1 then
  vim.list_extend(opts, {
    smoothscroll = true,
  })
end

set(global_opts, vim.g)
set(opts)

