return {
    "gitsigns.nvim",
    after = function()
        require("gitsigns").setup({})
    end,
    event = { "BufNewFile", "BufReadPost", "BufWritePost" },
}
