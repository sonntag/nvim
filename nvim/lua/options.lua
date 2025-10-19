vim.g.autoformat = true

vim.o.autoindent = true
vim.o.confirm = true
vim.o.expandtab = true -- no tabs!
vim.o.ignorecase = true
vim.o.inccommand = "split"
vim.o.list = true
vim.o.mouse = "a"
vim.o.scrolloff = 4 -- makes sure the cursor is buffered by 4 lines when scrolling
vim.o.shiftwidth = 4
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.virtualedit = "all"
vim.o.winborder = "rounded"
vim.o.wrap = false

vim.opt.clipboard:append("unnamedplus")

vim.g.health = {
    style = "float",
}

-- Diagnostic options
vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
})
