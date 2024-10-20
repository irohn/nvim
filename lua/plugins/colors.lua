return {

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			vim.opt.termguicolors = true
			require("colorizer").setup()
		end
	},

	{
		"EdenEast/nightfox.nvim",
		config = function()
			vim.cmd.colorscheme("carbonfox")
		end,
	},

}
