return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "python", "javascript", "typescript", "lua", "vim", "vimdoc" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
