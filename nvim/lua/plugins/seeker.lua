return {
    "seeker.nvim",
    after = function()
        require("seeker").setup({})
    end,
    before = function()
        require("lz.n").trigger_load("snacks.nvim")
    end,
    cmd = { "Seeker" },
    keys = {
        { "ff", ":Seeker files<cr>", desc = "Seek Files" },
        { "<leader>/", ":Seeker grep<cr>", desc = "Seek Grep" },
    },
}
