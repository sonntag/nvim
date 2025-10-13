return {
    "auto-save.nvim",
    after = function()
        require("auto-save").setup({
            condition = function(buf)
                -- Skip oil buffers
                -- if vim.bo[buf].filetype == 'oil' then return false end
                return vim.bo[buf].filetype ~= "oil"

                -- -- Get the full path of the buffer
                -- local path = vim.api.nvim_buf_get_name(buf)
                -- if path == "" then return false end
                --
                -- -- Check if the file is in a git repo
                -- local filepath = vim.fn.expand('%:p:h')
                -- return vim.fn.system('git -C ' .. filepath .. ' rev-parse --is-inside-work-tree 2>/dev/null') == "true\n"
            end,
        })
    end,
    event = { "BufReadPre", "BufNewFile" },
}
