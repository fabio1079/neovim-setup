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

				local function open_in_tab()
					local node = api.tree.get_node_under_cursor()
					if not node then
						return
					end
					if node.type == "directory" then
						api.node.open.edit()
						return
					end

					local path = vim.fn.fnamemodify(node.absolute_path, ":p")
					for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
						for _, window in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
							local buffer = vim.api.nvim_win_get_buf(window)
							if vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buffer), ":p") == path then
								vim.api.nvim_set_current_tabpage(tabpage)
								vim.api.nvim_set_current_win(window)
								return
							end
						end
					end

					api.node.open.tab()
				end

				local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
				vim.keymap.set("n", "<CR>", open_in_tab, opts)
				vim.keymap.set("n", "<2-LeftMouse>", open_in_tab, opts)
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
