local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<enter>", -- set to `false` to disable one of the mappings
			node_incremental = "<enter>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
})

require('nvim-ts-autotag').setup()
