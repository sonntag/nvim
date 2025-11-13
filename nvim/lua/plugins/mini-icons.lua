return {
    "mini.icons",
    after = function()
        require("mini.icons").setup()

        -- Replace nvim-web-devicons
        package.preload["nvim-web-devicons"] = function()
            require("mini.icons").mock_nvim_web_devicons()
            return package.loaded["nvim-web-devicons"]
        end
    end,
    lazy = true,
}
