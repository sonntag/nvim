return {
    "which-key.nvim",
    after = function()
        require("which-key").setup({
            delay = 0,
            spec = {
                { "<leader>a", group = "[a]i" },
                { "<leader>b", group = "[b]uffer" },
                { "<leader>c", group = "[c]ode" },
                { "<leader>d", group = "[d]ocument" },
                { "<leader>f", group = "[f]ind" },
                { "<leader>g", group = "[g]it" },
                { "<leader>h", group = "git [h]unk" },
                { "<leader>q", group = "[q]uit" },
                { "<leader>s", group = "[s]earch" },
                { "<leader>u", group = "[u]i toggles" },
                { "<leader>w", group = "[w]indow" },

                { "g", group = "[g]oto/[g]lobal" },
            },
            preset = "helix",
        })
    end,
    cmd = "WhichKey",
    event = "DeferredUIEnter",
}
