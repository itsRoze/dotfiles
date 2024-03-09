-- auto pairs
return {
	"echasnovski/mini.pairs",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader>up",
			function()
				local LazyUtil = require("lazy.core.util")
				vim.g.minipairs_disable = not vim.g.minipairs_disable
				if vim.g.minipairs_disable then
					LazyUtil.warn("Disabled auto pairs", { title = "Option" })
				else
					LazyUtil.info("Enabled auto pairs", { title = "Option" })
				end
			end,
			desc = "Toggle auto pairs",
		},
	},
}
