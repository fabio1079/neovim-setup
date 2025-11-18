-- Catppuccin theme
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      integrations = { treesitter = true, native_lsp = true }
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
