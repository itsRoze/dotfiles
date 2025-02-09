return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      auto_refresh = true,
      hide_during_completion = true,
      keymap = {
        accept = "<C-l>",
        dismiss = "<C-e>",
        next = "<C-[>",
        prev = "<C-]>",
      },
    },
  },
}
