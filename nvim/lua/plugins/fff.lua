return {
    "fff.nvim",
    keys = {
        {
            "<leader>ff",
            function()
                require("fff").find_files()
            end,
            desc = "FFFind files",
        },
    },
    lazy = false,
}
