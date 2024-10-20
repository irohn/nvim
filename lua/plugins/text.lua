return {

	{ "echasnovski/mini.icons", opts = {} },
	{ "echasnovski/mini.align", opts = {} },

	{
		"mbbill/undotree",
		config = function()
			require("config.undotree")
		end,
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = { "markdown" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			require("config.treesitter")
		end,
	},

}
