return {
    "codecompanion.nvim",
    before = function()
        require("lz.n").trigger_load("plenary.nvim")
    end,
    after = function()
        require("codecompanion").setup()
    end,
    keys = {
        { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle AI chat" },
        { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add selection to AI chat" },
    },
    event = "DeferredUIEnter",
}
