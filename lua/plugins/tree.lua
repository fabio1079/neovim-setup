return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Disable netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				api.config.mappings.default_on_attach(bufnr)

				local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
				vim.keymap.set("n", "<CR>", api.node.open.edit, opts)
				vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts)
				vim.keymap.set("n", "t", api.node.open.tab, opts)
			end,
			tab = {
				sync = {
					open = true,
				},
			},
			view = {
				width = 30,
			},
			filters = {
				dotfiles = false,
			},
		})
	end,
}
