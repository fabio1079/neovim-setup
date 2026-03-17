# Structure

  ~/.config/nvim/
  ├── init.lua                      # Entry point
  └── lua/
      ├── config/
      │   ├── options.lua           # General settings (line numbers, tabs, leader key)
      │   ├── keymaps.lua           # Key mappings
      │   └── lazy.lua              # Plugin manager bootstrap
      └── plugins/
          ├── tree.lua              # nvim-tree (Space+e to toggle)
          ├── statusline.lua        # lualine (airline-like status bar)
          ├── colorscheme.lua       # Bearded theme
          ├── treesitter.lua        # Syntax highlighting (python, js, ts)
          ├── telescope.lua         # Find in files (Space+ff)
          └── cmp.lua               # Autocomplete config

  Key bindings:
  - Space e — toggle file tree
  - Space f f — find files
  - Space f g — live grep (search content in files)
  - Space f b — find open buffers

  Autocomplete behavior:
  - Enter — always inserts a newline, never accepts a suggestion
  - Ctrl+y — confirms the autocomplete suggestion
  - Tab / Shift+Tab — navigate through suggestions

