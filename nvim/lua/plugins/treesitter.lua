return {
    "nvim-treesitter",
    after = function()
        ---@diagnostic disable: missing-fields
        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })
    end,
    event = { "BufNewFile", "BufReadPost", "BufWritePost", "DeferredUIEnter" },
    lazy = vim.fn.argc(-1) == 0,
}
