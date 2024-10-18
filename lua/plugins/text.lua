return {

	"tpope/vim-sleuth",

	{
		"echasnovski/mini.align",
		version = "*",
		opts = {},
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
		ft = { "markdown" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	},

}
