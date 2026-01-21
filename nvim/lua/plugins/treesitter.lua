return {
    "nvim-treesitter",
    after = function()
        -- Register Luna filetype
        vim.filetype.add({
            extension = {
                luna = "luna",
            },
        })

        vim.treesitter.language.register("luna", "luna")

        -- Main branch: enable treesitter highlighting and indentation for all supported filetypes
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                -- Only enable if a parser exists for this filetype
                if pcall(vim.treesitter.start, args.buf) then
                    -- Enable treesitter-based indentation
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
    event = { "BufNewFile", "BufReadPost", "BufWritePost", "DeferredUIEnter" },
    lazy = vim.fn.argc(-1) == 0,
}
