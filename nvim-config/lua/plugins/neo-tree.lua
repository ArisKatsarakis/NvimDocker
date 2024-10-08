return {
  "nvim-neo-tree/neo-tree.nvim",
  opt = {},
  config = function() 
    vim.keymap.set("n","<leader>e",":Neotree filesystem reveal left<CR>", {})
  end
}
