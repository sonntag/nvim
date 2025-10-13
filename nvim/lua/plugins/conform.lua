return {
    "conform.nvim",
    after = function()
        require("conform").setup({
            format_on_save = function(bufnr)
                if not (vim.g.autoformat or vim.b[bufnr].autoformat) then
                    return
                end

                return {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                    undojoin = true,
                }
            end,
            formatters_by_ft = {
                clojure = { "cljstyle" },
                lua = { "stylua" },
                markdown = { "mdformat" },
                nix = { "alejandra" },
            },
        })
    end,
    beforeAll = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    cmd = "ConformInfo",
    event = "BufWritePre",
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
}
