return {
    "diffview.nvim",
    after = function()
        require("diffview").setup({
            merge_tool = {
                layout = "diff3_mixed",
            },
        })
    end,
    before = function()
        require("lz.n").trigger_load("mini.icons")
    end,
    event = "DeferredUIEnter",
    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
        { "<leader>gf", "<cmd>DiffviewFileHistory<cr>", desc = "Open File History" },
    },
}
