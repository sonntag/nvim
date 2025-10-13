return {
    "oil.nvim",
    after = function()
        require("oil").setup({
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            keymaps = {
                -- setting to false disables the keybindings. Disabling these allows me to still use
                -- Tmux navigations with Oil open.
                ["<C-s>"] = false,
                ["<C-h>"] = false,
                ["<C-t>"] = false,
                ["<C-l>"] = false,
                -- Refresh was originally bound to <C-l> so rebinding it since it's actually useful
                ["<C-r>"] = "actions.refresh",
            },
        })
    end,
    before = function()
        require("lz.n").trigger_load("mini.icons")
    end,
    cmd = "Oil",
    lazy = vim.fn.argc(-1) == 0,
    keys = { { "-", "<cmd>Oil<CR>", desc = "Open parent directory" } },
}
