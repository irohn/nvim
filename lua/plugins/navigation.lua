return {

	{
		"stevearc/oil.nvim",
		config = function()
			require("config.oil")
		end,
	},
	{
		"refractalize/oil-git-status.nvim",
		dependencies = { "stevearc/oil.nvim" },
		config = true
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("config.telescope")
		end,
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("config.harpoon")
		end,
	},

}
