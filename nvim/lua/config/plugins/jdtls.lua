return {
  {
    'mfussenegger/nvim-jdtls',
    config = function()
      vim.keymap.set("n", "<leader>co", "<Cmd>lua require'jdtls'.organize_imports()<CR>")
    end
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  }
}
