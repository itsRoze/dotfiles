return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      -- use Shift-h to toggle hidden items
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          "package-lock.json",
          ".git",
        },
      },
    },
  },
}
