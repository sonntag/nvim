return {
    "diffview.nvim",
    after = function()
        require("diffview").setup()
    end,
    event = "DeferredUIEnter",
}
