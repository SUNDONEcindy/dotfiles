-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- vim.keymap.del("n", "<leader><space>")

-- vim.keymap.set("n", "<leader>snH", ":Telescope notify<CR>", { desc = "Notify history" })

-- buffer
vim.keymap.set(
  "n",
  "<leader>bb",
  "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
  { desc = "Telescope buffers" }
)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move current line down
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv") -- Move current line up
