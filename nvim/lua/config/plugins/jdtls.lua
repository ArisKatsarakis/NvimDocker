return {
  {
    'mfussenegger/nvim-jdtls',
    config = function()
      vim.keymap.set("n", "<leader>co", "<Cmd>lua require'jdtls'.organize_imports()<CR>")
    end
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require('mason')
      local masonInstaller = require('mason-tool-installer')
      mason.setup(
        {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          }
        }
      )
      masonInstaller.setup({
        ensure_installed = {
          "clangd",
          "clang-format"
        }
      })
    end
  }
}
