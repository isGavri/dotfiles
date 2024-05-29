return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"RRethy/base16-nvim",
	},
	config = function()
		local config = require("lualine")
		config.setup({
			options = {
				--theme = "onedark"
				--theme = "nord",
				--theme = "tomorrow_night"
				--theme = "iceberg_dark"
				--theme = "dracula"
				--theme = "ayu_mirage"
				--theme = "gruvbox_material"
				--theme = "gruvbox_dark"
				--theme = "modus-vivendi",
        theme = "auto"
			},
			sections = {
				lualine_a = { "location" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "filename" },
				lualine_x = { "diagnostics" },
				lualine_y = { "filetype", "progress" },
				lualine_z = { "mode" },
			},
		})
	end,
}
