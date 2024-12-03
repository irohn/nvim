local map = function(mode, lhs, rhs, opts)
  local options = { 
    noremap = true,
    silent = true,
  }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  local function set_keymap(mode, l, r, options)
    vim.keymap.set(mode, l, r, options)
  end

  if type(lhs) == "table" then
    for _, l in ipairs(lhs) do
      set_keymap(mode, l, rhs, options)
    end
  else
    set_keymap(mode, lhs, rhs, options)
  end
end

-- clear hightlights
map("n", "<esc>", "<cmd>nohlsearch<cr><esc>")

-- indent while remaining in visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- copy/paste to/from clipboard
map({"n","v"}, {"<s-y>", "<leader>y"}, "\"*y")
map({"n","v"}, {"<s-p>", "<leader>p"}, "\"*p")

-- move between buffers
map("n", "<s-h>", "<cmd>bprev<cr>")
map("n", "<s-l>", "<cmd>bnext<cr>")

-- open file explorer
map("n", "-", "<cmd>Explore<cr>")

-- keeping the cursor centered
map("n", "<c-d>", "<c-d>zz")
map("n", "<c-u>", "<c-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- vim: ts=2 sts=2 sw=2 et
