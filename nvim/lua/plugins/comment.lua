return {
    "Comment.nvim",
    after = function()
        require("Comment").setup()
    end,
    event = "DeferredUIEnter",
}
