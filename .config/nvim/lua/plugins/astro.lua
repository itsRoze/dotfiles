return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "astro")
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        astro = { "prettier" },
      },
      formatters = {
        prettier = {
          condition = function(ctx)
            return vim.fs.find({
              ".prettierrc",
              ".prettierrc.json",
              ".prettierrc.yml",
              ".prettierrc.yaml",
              ".prettierrc.json5",
              ".prettierrc.js",
              "prettier.config.js",
              "prettier.config.ts",
              ".prettierrc.mjs",
              "prettier.config.mjs",
              ".prettierrc.cjs",
              "prettier.config.cjs",
              ".prettierrc.toml",
            }, { path = ctx.filename, upward = true })[1]
          end,

          prepend_args = function(_, ctx)
            local filetype = require("plenary.filetype").detect_from_extension(ctx.filename)

            if filetype ~= "astro" then
              return {}
            end

            return {
              "--stdin-filepath",
              ctx.bufname,
              "--plugin=prettier-plugin-astro",
            }
          end,
        },
      },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override_by_extension = {
        astro = {
          icon = "",
          color = "#EF8547",
          name = "astro",
        },
      },
    },
  },
}
