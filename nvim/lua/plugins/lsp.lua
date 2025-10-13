return {
    "nvim-lspconfig",
    after = function()
        vim.lsp.enable({ "lua_ls", "nixd", "clojure_lsp", "marksman" })
    end,
    event = "DeferredUIEnter",
}
