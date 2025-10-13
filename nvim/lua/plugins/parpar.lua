return {
    "parpar.nvim",
    after = function()
        require("parpar").setup({})
    end,
    before = function()
        require("lz.n").trigger_load("nvim-parinfer")
        require("lz.n").trigger_load("nvim-paredit")
    end,
    ft = { "clojure" },
}
