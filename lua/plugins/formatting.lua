return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      sh = { "shfmt" },
      python = { "black", "isort" },
      javascript = { "prettier", "prettierd", stop_after_first = true },
      javascriptreact = { "prettier", "prettierd", stop_after_first = true },
      typescript = { "prettier", "prettierd", stop_after_first = true },
      typescriptreact = { "prettier", "prettierd", stop_after_first = true },
      rust = { "rustfmt" },
      go = { "goimports", "gofmt", stop_after_first = true },
      sql = { "pg_format", "sql_formatter" },
      yaml = { "yamlfmt" },
    },
  },
}
