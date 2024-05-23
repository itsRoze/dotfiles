return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "intelephense")
      table.insert(opts.ensure_installed, "phpcs")
      table.insert(opts.ensure_installed, "php-cs-fixer")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "php")
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "php_cs_fixer" },
      },
    },
  },
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvimtools/none-ls.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>aa", ":Laravel artisan<cr>" },
      { "<leader>ar", ":Laravel routes<cr>" },
      { "<leader>am", ":Laravel related<cr>" },
    },
    event = { "VeryLazy" },
    config = true,
  },
}
