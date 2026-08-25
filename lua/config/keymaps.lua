local map = vim.keymap.set

-- File tree toggle
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })

-- Telescope find files
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })

map("n", "<leader>nt", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "<leader>pt", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
map("n", "<leader>ct", "<cmd>tabclose<cr>", { desc = "Close tab" })
map("n", "<leader>cT", "<cmd>tabonly<cr>", { desc = "Close other tabs" })

map("v", "<RightMouse>", '"+y', { desc = "Copy selection" })
