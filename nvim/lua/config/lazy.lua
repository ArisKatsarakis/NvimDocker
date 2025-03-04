-- Bootstrap lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- {
    --   "scottmckendry/cyberdream.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     require("cyberdream").setup({
    --       terminal_colors = true,
    --       transparent = true,
    --     })
    --     vim.cmd.colorscheme "cyberdream"
    --   end,
    -- },
    -- { "folke/tokyonight.nvim",  config = function() vim.cmd.colorscheme "tokyonight" end },
    -- { "diegoulloao/neofusion.nvim", priority = 1000, config = function() require("neofusion").setup({ terminal_color = true, }) vim.o.background = "dark" vim.cmd([[ colorscheme neofusion ]]) end, },
    {
      'Everblush/nvim',
      name = 'everblush',
      config = function()
        require('everblush').setup({})
        vim.cmd('colorscheme everblush')
      end
    },
    -- { "catppuccin/nvim", name = "catppuccin", priority = 1000, config = function() colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha require('catppuccin').setup({ flavour = 'mocha', transparent_background = false, term_colors = true }) vim.cmd.colorscheme "catppuccin" end },
    { import = "config.plugins" },
  },
})
