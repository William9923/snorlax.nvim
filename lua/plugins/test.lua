return {
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-go"] = {
          experimental = {
            test_table = true,
          },
          args = { "-count=1", "-timeout=30s" },
          adapters = {},
        },
        ["neotest-plenary"] = {},
      },
      status = { virtual_text = true },
      output = { open_on_run = true },
    },
  },
  { "nvim-neotest/neotest-plenary" },
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>td",
        function()
          require("neotest").run.run_last({ strategy = "dap" })
        end,
        desc = "Debug Nearest",
      },
    },
  },
}
