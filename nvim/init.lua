vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 2

require("config.lazy")


vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("n", "<space><space>x", ":source % <CR>")
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

vim.keymap.set("n", "<leader>bd", ":bd<CR>")
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- samples commands
local job_terminal_id = 0
vim.keymap.set("n", "<leader>ft", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 25)

  job_terminal_id = vim.bo.channel
end)
--TODO fix any errors
-- build procect command
vim.keymap.set("n", "<leader>bp", function()
  local cdir = vim.uv.cwd()
  local files = vim.fn.readdir(cdir)
  for _, file in ipairs(files) do
    if (file == 'build.gradle') then
      print('found')
      return
    end
  end
  local parent_dir = vim.fn.fnamemodify(cdir, ":h") -- Get parent directory
  files = vim.fn.readdir(parent_dir)
  for _, file in ipairs(files) do
    if (file == 'build.gradle') then
      print('found in parent_dir')
    end
  end

  -- TODO execute the following commands in terminal using chansend:
  -- cd to dir found the build.gradle
  -- execute build.gradle
  -- return after finishing the gradle
end
)
