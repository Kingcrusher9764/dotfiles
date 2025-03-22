-- this file is used to remap the command to some keys

-- it maps the leader key to space
vim.g.mapleader = " "

-- it maps the key to exit the file in vim 
-- it maps the <leader>pv command in normal mode to exit the file
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- show line numbers
vim.opt.nu = true
-- shows relative line numbers
vim.opt.rnu = true

-- make the tab of 4 character long not 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- prevent line wrap
vim.opt.wrap = false

-- undo tree setup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- disable search highlight
-- vim.opt.hlsearch = true
-- enable incremental search 
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- make the 8 line offset in scroll up and down
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- fast update time
vim.opt.updatetime = 50

-- color the column 80
vim.opt.colorcolumn = "80"

-- color the current line
vim.opt.cursorline = true

-- ===========================================================

-- keymap for save and exit
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")

-- keymap for Lazy
vim.keymap.set("n", "<leader>P", "<cmd>Lazy<cr>")

-- keymap to move line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste with buffer intact
vim.keymap.set("n", "<leader>p", "\"_dP")

-- yank in the clipboard
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

