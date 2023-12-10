return {
  "FeiyouG/commander.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    -- { "<leader>f", "<CMD>Telescope commander<CR>", mode = "n" },
    { "<leader><space>", "<CMD>Telescope commander<CR>", mode = "n", desc = "Commander" },
  },
  config = function()
    require("commander").setup({
      components = {
        "DESC",
        "KEYS",
        "CAT",
        "CMD",
      },
      sort_by = {
        "DESC",
        "KEYS",
        "CAT",
        "CMD",
      },
      integration = {
        telescope = {
          enable = true,
        },
        lazy = {
          enable = true,
          set_plugin_name_as_cat = true,
        },
      },
    })
  end,
}
