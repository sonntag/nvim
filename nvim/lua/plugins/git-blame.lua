return {
    "blame.nvim",
    after = function()
        require("blame").setup({})
    end,
    keys = {
        { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Toggle blame" },
    },
}
