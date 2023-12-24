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
        },
        ["neotest-plenary"] = {},
      },
      status = { virtual_text = true },
      output = { open_on_run = true },
    },
  },
  { "nvim-neotest/neotest-plenary" },
}
