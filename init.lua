-- set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- load plugin manager
require("config.lazy")

-- custom theme management
require("config.theme").setup()

-- vim: ts=2 sts=2 sw=2 et
