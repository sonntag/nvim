if vim.env.PROF then
    vim.cmd.packadd("snacks.nvim")
    require("snacks.profiler").startup({
        startup = {
            event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
        },
    })
end

require("autocommands")
require("keymaps")
require("options")
require("lz.n").load("plugins")
vim.cmd("colorscheme rose-pine")
