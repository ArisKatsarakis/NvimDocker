return {
	{
  -- Ensure nvim-lspconfig is loaded
  "neovim/nvim-lspconfig",
    config = function(_, opts)
    local lspconfig = require("lspconfig")
    local cmp_vnim = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.jdtls.setup({
      cmd = {
        "/usr/lib/jvm/java-21-openjdk/bin/java",  -- Replace with your Java 8 binary path, if needed
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1G",
        "-jar", "/root/jdt-language-server-latest/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",
        "-configuration", "/root/jdt-language-server-latest/config_linux",  -- Or config_mac, config_win as needed
        "-data", "/root/jdtls_workspace"
      },
      root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
      settings = {
        java = {
          signatureHelp = { enabled = true },
          contentProvider = { preferred = "fernflower" }, -- Optional decompiler
        },
      },
      on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local opts = { noremap = true, silent = true }
        buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      end,
      capabilities =  cmp_vnim
    })
  end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "jdtls" },
			})
		end,
	},
}

