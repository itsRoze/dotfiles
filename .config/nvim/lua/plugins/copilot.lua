return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-l>",
        dismiss = "<C-e>",
        next = "<c-[>",
        prev = "<c-]>",
      },
    },
  },
}
