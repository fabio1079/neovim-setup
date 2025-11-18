-- LSP configuration
return {
  { "neovim/nvim-lspconfig" },

  -- Python LSP (pyright) + installer
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function() require("mason").setup() end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright" }, -- installs pyright automatically
        automatic_installation = true,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Enable pyright with custom capabilities (using new vim.lsp.config API)
      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })
      vim.lsp.enable({ "pyright" })

      -- Global keymap for LSP (optional but nice)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufmap = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = args.buf })
          end
          bufmap("n", "gd", vim.lsp.buf.definition)
          bufmap("n", "K",  vim.lsp.buf.hover)
          bufmap("n", "<leader>rn", vim.lsp.buf.rename)
        end,
      })
    end,
  },
}
