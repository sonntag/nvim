return {
    "ultimate-autopair.nvim",
    after = function()
        require("ultimate-autopair").setup({
            bs = {
                map = false,
                cmap = false,
            },
        })
    end,
    event = { "InsertEnter", "CmdlineEnter" },
    enabled = true,
}
