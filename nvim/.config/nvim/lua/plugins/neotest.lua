return {
  "nvim-neotest/neotest",
  dependencies = { "marilari88/neotest-vitest" },
  opts = function(_, opts)
    table.insert(opts.adapters, require("neotest-vitest"))
  end,
  keys = {
    { "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach to the nearest test" },
    { "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Run last test" },
    -- { "<leader>to", "<cmd>lua require('neotest').output.toggle()<cr>", desc = "Toggle this test output" },
    { "<leader>tp", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop the nearest test" },
    { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Toggle Test Summary" },
    -- { "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", desc = "Run the nearest test" },
    { "<leader>tT", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Test the current file" },
  },
}
