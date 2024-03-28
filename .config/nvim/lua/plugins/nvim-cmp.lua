return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")

    local comp_opts = {
      winhighlight = "Normal:Pmenu",
    }

    local doc_opts = {
      winhighlight = "Normal:Pmenu",
    }

    opts.window = {
      completion = cmp.config.window.bordered(comp_opts),
      documentation = cmp.config.window.bordered(doc_opts),
    }

    opts.mapping = {
      ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
      ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
      ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
      ["<C-e>"] = cmp.mapping.abort(), -- close completion window
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }
  end,
}
