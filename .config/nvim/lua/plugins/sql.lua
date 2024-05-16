return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "sql-formatter",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {

      formatters_by_ft = {
        sql = { "sql-formatter" },
      },
      formatters = {
        ["sql-formatter"] = {
          command = "/Users/roze/.local/share/nvim/mason/bin/sql-formatter",
        },
      },
    },
  },
}
