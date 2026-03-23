return {
    "neorg",
    before = function()
        require("lz.n").trigger_load("nui.nvim")
        require("lz.n").trigger_load("nvim-nio")
        require("lz.n").trigger_load("lua-utils.nvim")
        require("lz.n").trigger_load("pathlib.nvim")
        require("lz.n").trigger_load("plenary.nvim")
        require("lz.n").trigger_load("nvim-treesitter")
    end,
    after = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                        default_workspace = "notes",
                    },
                },
            },
        })
    end,
    cmd = "Neorg",
    ft = "norg",
}
