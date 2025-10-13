vim.g.mapleader = " "
vim.g.maplocalleader = ","

local map = vim.keymap.set

map("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "Clear highlights on search" })

map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- Window management
map("n", "<leader>-", "<c-w>s", { desc = "Split Window Below" })
map("n", "<leader>|", "<c-w>v", { desc = "Split Window Vertically" })
map("n", "<leader>wd", "<c-w>c", { desc = "Delete Window" })

--  Move cursor to the middle of the screen when paging up or down
map("n", "<c-u>", "<c-u>zzzv", { desc = "Page up" })
map("n", "<c-d>", "<c-d>zzzv", { desc = "Page down" })

-- Move cursor to middl of screen when selecting search results
map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Prev search result" })

-- Line movement improvements
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Tab management
-- TODO

-- Buffer management
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function()
    Snacks.bufdelete()
end, { desc = "Delete buffer" })
map("n", "<leader>bo", function()
    Snacks.bufdelete.other()
end, { desc = "Delete other buffers" })

-- If the line is empty, these 4 keymaps will enter insert mode with proper indentation
vim.keymap.set("n", "i", function()
    return string.match(vim.api.nvim_get_current_line(), "%g") == nil and "S" or "i"
end, { desc = "insert", expr = true, noremap = true })
vim.keymap.set("n", "I", function()
    return string.match(vim.api.nvim_get_current_line(), "%g") == nil and "S" or "I"
end, { desc = "insert at beginning of line", expr = true, noremap = true })
vim.keymap.set("n", "a", function()
    return string.match(vim.api.nvim_get_current_line(), "%g") == nil and "S" or "a"
end, { desc = "append", expr = true, noremap = true })
vim.keymap.set("n", "A", function()
    return string.match(vim.api.nvim_get_current_line(), "%g") == nil and "S" or "A"
end, { desc = "append at end of line", expr = true, noremap = true })

-- TODO: remove these keymaps when tmux-navigator is fixed
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
