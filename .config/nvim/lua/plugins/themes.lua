return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		puiority = 1000,
		config = function()
			local catppuccin = require("catppuccin")
			catppuccin.setup({
				flavour = "mocha",
				--flavour = "frappe",
			})
			--vim.cmd.colorscheme("catppuccin")
			--vim.cmd.colorscheme("catppuccin-frappe")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			local kanagawa = require("kanagawa")
			kanagawa.setup({
				--theme = "dragon",
			})
			--vim.cmd.colorscheme("kanagawa")
			vim.cmd.colorscheme("kanagawa-dragon")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		jpriority = 1000,
		config = true,
		opts = function()
			--vim.o.background = "dark"
			--vim.cmd([[colorscheme gruvbox]])
		end,
	},
}
