return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      sh = { "shfmt" },

      -- NOTE: Conform will run multiple formatters sequentially
      python = { "black", "isort" },

      -- NOTE: Use a sub-list to run only the first available formatter
      javascript = { { "prettier", "prettierd" } },
      rust = { "rustfmt" },
      go = { { "goimports", "gofmt" } },
      sql = { "pg_format", "sql_formatter" },
      yaml = { "yamlfmt" },
    },
  },
}
