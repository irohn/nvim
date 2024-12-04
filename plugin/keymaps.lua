local map = require("config.utils").keymap

-- clear hightlights
map("n", "<esc>", "<cmd>nohlsearch<cr><esc>")

-- indent while remaining in visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- copy/paste to/from clipboard
map({"n","v"}, "<s-y>", "\"*y")
map({"n","v"}, "<s-p>", "\"*p")

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

map("n", "<leader>m", "<cmd>messages<cr>")

-- vim: ts=2 sts=2 sw=2 et
