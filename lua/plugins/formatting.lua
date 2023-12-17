local Util = require("lazyvim.util")
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
      fish = { "fish_indent" },
      sh = { "shfmt" },
      -- Conform will run multiple formatters sequentially
      python = { "black", "isort" },
      -- Use a sub-list to run only the first available formatter
      javascript = { { "prettierd", "prettier" } },
      rust = { "rustfmt" },
      go = { { "goimports", "gofmt" } },
      sql = { "pg_format", "sql_formatter" },
      yaml = { "yamlfmt" },
    },

    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
