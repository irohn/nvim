return {

	{ "echasnovski/mini.icons", opts = {} },
	{ "echasnovski/mini.align", opts = {} },

	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle,
				{ silent = true, noremap = true, desc = "undo tree" })
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
		config = function()
			require("config.treesitter")
		end,
	},

}
