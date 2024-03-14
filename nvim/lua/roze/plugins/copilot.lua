return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	-- enabled = true,
	event = "InsertEnter",
	-- build = ":Copilot auth",
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = true,
			keymap = {
				accept = "<C-l>",
				dismiss = "<C-e>",
				next = "<c-j>",
				prev = "<c-k>",
			},
		},
	},
}
