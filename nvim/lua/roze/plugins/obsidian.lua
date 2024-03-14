return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian - Search" },
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "/Users/roze/Library/Mobile Documents/iCloud~md~obsidian/Documents/elijah/",
      },
    },
    templates = {
      subdir = "999 🐑 Templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
      tags = "",
    },
  },
}
