return {
    "copilot.lua",
    after = function()
        require("copilot").setup({
            server = {
                type = "binary",
            },
            -- suggestion = {
            --     auto_trigger = true,
            --     keymap = {
            --         accept = "<tab>",
            --     },
            -- },
            -- nes = {
            --     enable = true,
            --     accept_and_goto = "<leader>p",
            --     accept = false,
            --     dismiss = "<esc>",
            -- },
        })
    end,
    cmd = "Copilot",
    event = "InsertEnter",
}
