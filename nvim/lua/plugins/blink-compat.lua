return {
    "blink.compat",
    after = function()
        require("blink.compat").setup()
    end,
    lazy = true,
}
