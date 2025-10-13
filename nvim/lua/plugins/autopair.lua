return {
    "ultimate-autopair.nvim",
    after = function()
        require("ultimate-autopair").setup({})
    end,
    event = { "InsertEnter", "CmdlineEnter" },
}
