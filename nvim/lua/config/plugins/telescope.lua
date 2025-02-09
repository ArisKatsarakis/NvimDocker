return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
      }
    },
    config = function()
      -- TODO inspect telescope themes for different pickers
      -- add space fh for find help
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "dropdown"
          }
        }
      }
      vim.keymap.set("n", "<leader><leader>", require('telescope.builtin').find_files)
      -- references finder
      vim.keymap.set("n", "<leader>fr",
        function()
          local opts = require('telescope.themes').get_ivy()
          require("telescope.builtin").lsp_references(opts)
        end)
      local cool = "hello"
      print(cool)
    end
  }

}
