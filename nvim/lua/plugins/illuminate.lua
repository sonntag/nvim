return {
    "vim-illuminate",
    after = function()
        require("illuminate").configure({
            min_count_to_highlight = 2,
            filetypes_denylist = {
                "dirbuf",
                "dirvish",
                "fugitive",
                "oil",
            },
        })

        vim.api.nvim_set_hl(0, "IlluminatedWordText", {
            underline = true,
            bg = "NONE",
        })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", {
            underline = true,
            bg = "NONE",
        })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", {
            underline = true,
            bg = "NONE",
        })
    end,
    event = "DeferredUIEnter",
}
