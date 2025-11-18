 -- Telescope – fuzzy finder
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "Live grep (search in files)" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>",  desc = "Find help" },
  },
}
