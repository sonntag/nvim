return {
    "nvim-treesitter-context",
    after = function()
        require("treesitter-context").setup({})
    end,
    event = { "BufNewFile", "BufReadPost", "BufWritePost", "DeferredUIEnter" },
}
