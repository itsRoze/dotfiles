return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				lsp_doc_border = true,
				command_palette = true,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		keys = {
			{
				"<leader>hl",
				function()
					require("noice").cmd("last")
				end,
				desc = "Noice Last Message",
			},
			{
				"<leader>hh",
				function()
					require("noice").cmd("history")
				end,
				desc = "Noice History",
			},
			{
				"<leader>ha",
				function()
					require("noice").cmd("all")
				end,
				desc = "Noice All",
			},
			{
				"<leader>hd",
				function()
					require("noice").cmd("dismiss")
				end,
				desc = "Dismiss All",
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 8000,
		},
	},
}
