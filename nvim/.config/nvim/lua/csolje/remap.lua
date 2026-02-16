vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Move highlighted line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("i", "jj", "<Esc>", { noremap = false })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- format buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quickfix and location list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- find and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- comment line
vim.keymap.set({ "n", "v" }, "<leader>!", "0i!<Esc>")
vim.keymap.set({ "n", "v" }, "<leader>'", "0i'<Esc>")
vim.keymap.set({ "n", "v" }, "<leader>-", "0i--<Esc>")
vim.keymap.set({ "n", "v" }, "<leader>#", "0i##<Esc>")
vim.keymap.set({ "n", "v" }, "<leader>6", "^x")
-- Tmux navigation
--vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
--vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
--vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
--vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
--vim.keymap.set("i", "<C-a>", "<cmd>copilot#Accept('\\<CR>')<CR>", { silent = true })
--vim.g.copilot_no_tab_map = true

vim.cmd [[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true
-- vim.keymap.set.keymap("i", "<C-a>", "<cmd>copilot#Accept('\\<CR>')<CR>", { silent = true })
-- Calling lazygit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>")
vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>")
