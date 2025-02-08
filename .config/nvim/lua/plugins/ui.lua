return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },
  {
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
    end,
  },
}
