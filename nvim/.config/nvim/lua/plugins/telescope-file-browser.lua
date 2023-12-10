return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>fB",
      ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      desc = "Browse Files",
    },
  },
}
