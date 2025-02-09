return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      -- TODO inspect telescope themes for different pickers
      -- add space fh for find help
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "dropdown"
          }
        },
        extensions = {
          fzf = {}
        },
      }

      require('telescope').load_extension('fzf')

      vim.keymap.set("n", "<leader><leader>", require('telescope.builtin').find_files)
      vim.keymap.set("n", "<leader>fb", require('telescope.builtin').buffers)
      -- references finder
      vim.keymap.set("n", "<leader>fr",
        function()
          local opts = require('telescope.themes').get_ivy()
          require("telescope.builtin").lsp_references(opts)
        end)
      require "config.plugins.telescope.multigrep".setup()
    end
  }
}
