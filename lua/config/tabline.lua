local M = {}

local function escape(text)
	return text:gsub("%%", "%%%%")
end

function M.render()
	local current = vim.fn.tabpagenr()
	local tabs = {}

	for tab = 1, vim.fn.tabpagenr("$") do
		local tabpage = vim.api.nvim_list_tabpages()[tab]
		local buffer
		for _, window in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
			local candidate = vim.api.nvim_win_get_buf(window)
			if vim.bo[candidate].filetype ~= "NvimTree" then
				buffer = candidate
				break
			end
		end

		buffer = buffer or vim.api.nvim_win_get_buf(vim.api.nvim_tabpage_get_win(tabpage))
		local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buffer), ":t")
		if name == "" then
			name = "[No Name]"
		end

		local highlight = tab == current and "%#TabLineSel#" or "%#TabLine#"
		table.insert(tabs, string.format("%s%%%dT %s %%T%%#TabLine#%%%dX x %%T", highlight, tab, escape(name), tab))
	end

	return "%#TabLineFill#%=" .. table.concat(tabs) .. "%#TabLineFill#%T"
end

return M
