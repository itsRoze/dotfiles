return {
  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    cmd = "Codeium",
    build = ":Codeium Auth",
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set("i", "<C-l>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<M-[>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<M-]>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<M-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
      vim.keymap.set("i", "<M-i>", function()
        return vim.fn["codeium#Complete"]()
      end, { expr = true })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("codeium"))
    end,
  },
}
