return {
    "fff.nvim",
    keys = {
        {
            "ff",
            function()
                require("fff").find_files()
            end,
            desc = "FFFind files",
        },
    },
    lazy = false,
}
