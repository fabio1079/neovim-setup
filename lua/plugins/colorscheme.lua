-- Catppuccin theme
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        treesitter = true,
        native_lsp = true,
        neo_tree = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
