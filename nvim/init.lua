vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 2
vim.o.background = 'dark'
require("config.lazy")


vim.keymap.set("n", "<space>x", "<Cmd>:.lua<CR>")
vim.keymap.set("n", "<space><space>x", "<Cmd>:source % <CR>")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- buffer
vim.keymap.set("n", "<leader>bd", "<Cmd>:bd!<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>qq", "<Cmd>:qall<CR>")
-- split & expand buffers
vim.keymap.set("n", "<leader>|", "<Cmd>:vsplit<CR>")
vim.keymap.set("n", "<leader>-", "<Cmd>:split<CR>")

vim.keymap.set("n", "<leader>ft", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 40)
end)
