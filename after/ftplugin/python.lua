local map = require("config.utils").keymap

map("n", "<leader>w", "<cmd>w | !python3 ./%<cr>", {
  buffer = true,
  desc = "run current file",
})

-- vim: ts=2 sts=2 sw=2 et
