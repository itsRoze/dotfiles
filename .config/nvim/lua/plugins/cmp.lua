return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-k>"] = {
        function(cmp)
          cmp.select_prev()
        end,
      },
      ["<C-j>"] = {
        function(cmp)
          cmp.select_next()
        end,
      },
    },
  },
}
