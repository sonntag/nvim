return {
    "image.nvim",
    after = function()
        require("image").setup({
            backend = "kitty",
            processor = "magick_rock",
        })
    end,
    event = "DeferredUIEnter",
}
