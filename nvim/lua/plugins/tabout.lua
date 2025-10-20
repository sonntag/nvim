return {
    "tabout.nvim",
    after = function()
        require("tabout").setup({
            tabkey = "",
            backwards_tabkey = "",
        })
    end,
    event = "DeferredUIEnter",
}
