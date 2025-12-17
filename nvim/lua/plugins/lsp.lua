return {
    "nvim-lspconfig",
    after = function()
        vim.lsp.enable({
            "clojure_lsp",
            "lua_ls",
            "marksman",
            "nixd",
            "rust_analyzer",
            "ts_ls",
        })
    end,
    event = "DeferredUIEnter",
}
