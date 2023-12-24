return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  opts = {
    -- NOTE: change formatter based on this file

    ---@type table<string, conform.FormatterUnit[]>
    formatters_by_ft = {
      lua = { "stylua" },
      sh = { "shfmt" },
      -- NOTE: Conform will run multiple formatters sequentially
      python = { "black", "isort" },
      -- NOTE: Use a sub-list to run only the first available formatter
      javascript = { { "prettierd", "prettier" } },
      rust = { "rustfmt" },
      go = { { "gofmt", "goimports" } },
      sql = { "pg_format", "sql_formatter" },
      yaml = { "yamlfmt" },
    },
  },
}
