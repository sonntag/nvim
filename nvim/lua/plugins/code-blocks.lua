return {
    "nvim-code-blocks",
    after = function()
        require("nvim-code-blocks").setup({
            highlight = {
                enabled = true,
                hl_group = "CodeBlock",
                auto_update = true,
            },
        })
    end,
    event = "DeferredUIEnter",
}
