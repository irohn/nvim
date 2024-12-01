local map = function(mode, lhs, rhs, opts)
  local options = { 
    noremap = true,
    silent = true,
  }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- clear hightlights
map("n", "<esc>", "<cmd>nohlsearch<cr><esc>")

-- single click dents
map("v", "<", "<gv")
map("v", ">", ">gv")

-- copy/paste to/from clipboard
map({"n","v"}, "<leader>y", "\"*y")
map({"n", "v"}, "<leader>p", "\"*p")

-- move between buffers
map("n", "<s-h>", "<cmd>bprev<cr>")
map("n", "<s-l>", "<cmd>bnext<cr>")

-- vim: ts=2 sts=2 sw=2 et
