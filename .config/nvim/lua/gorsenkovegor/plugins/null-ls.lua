local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.ruff,
        -- formatting
        null_ls.builtins.formatting.gofumpt, -- go 
        null_ls.builtins.formatting.black, -- python
        null_ls.builtins.formatting.rustfmt, -- rust

    },
})
