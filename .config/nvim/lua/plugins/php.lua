return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "pint", "php_cs_fixer" },
        blade = { "blade-formatter" },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- just extend options; LazyVim still calls setup()
    opts = function(_, opts)
      -- make sure ensure_installed exists
      opts.ensure_installed = opts.ensure_installed or {}

      -- add the parsers you want
      vim.list_extend(opts.ensure_installed, {
        "php",
        "blade",
        -- "php_only", -- optional; you can add this back if you want
      })

      -- make *.blade.php use the blade filetype
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      return opts
    end,
  },
}
