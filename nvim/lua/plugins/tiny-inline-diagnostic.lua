return {
    "tiny-inline-diagnostic.nvim",
    after = function()
        require("tiny-inline-diagnostic").setup({
            options = {
                show_source = {
                    enabled = true,
                },
                use_icons_from_diagnostic = true,
            },
        })
    end,
    event = "DeferredUIEnter",
}
