vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

vim.keymap.set("n", "<C-left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-right>", "<cmd>vertical resize +2<cr>")
vim.keymap.set("n", "<C-up>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-down>", "<cmd>resize -2<cr>")

vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprev)

