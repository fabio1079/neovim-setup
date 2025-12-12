return {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
        local nls = require("null-ls")
        opts.sources = opts.sources or {}
        table.insert(opts.sources, nls.builtins.formatting.rustfmt)
        -- Optional: use taplo for Cargo.toml if you want
        table.insert(opts.sources, nls.builtins.formatting.taplo)
    end,
}
