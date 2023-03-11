local vim = vim
local api = vim.api
local set = vim.opt

set.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable branch
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("lazy").setup('plugins')

vim.wo.wrap = false
set.completeopt = 'menu,menuone,noselect'
set.showtabline = 2
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.smarttab = true
set.number = true
set.background = "dark"
set.encoding = "utf-8"
set.fileencoding = "utf-8"
set.autoread = true
set.wildmenu = true
set.expandtab = true
vim.o.nobackup = true
vim.o.nowritebackup = true
vim.o.noshowmode = true
set.timeoutlen = 500
set.clipboard = 'unnamedplus'
set.conceallevel = 1
set.mouse = 'a'
set.guifont = 'JetBrainsMono Nerd Font:10'
set.hidden = true
set.signcolumn = "no"

-- wrapper for writing key mapping
local map = function(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

map("n", "<TAB>", ":bnext<CR>", { silent = true })
map("n", "<S-TAB>", ":bprevious<CR>", { silent = true })
map("n", "<Esc>", ":noh<CR>", { silent = true })
map("n", "<C-h>", [[ <C-\><C-n><C-W>h ]], { silent = true })
map("n", "<C-j>", [[ <C-\><C-n><C-W>j ]], { silent = true })
map("n", "<C-k>", [[ <C-\><C-n><C-W>k ]], { silent = true })
map("n", "<C-l>", [[ <C-\><C-n><C-W>l ]], { silent = true })

--vim.cmd([[ colorscheme palenight ]])
--vim.cmd([[ colorscheme moonbow ]])
--vim.cmd([[ colorscheme everforest ]])
--vim.cmd([[ colorscheme gruvbox ]])
--vim.cmd([[ colorscheme kanagawa ]])
--vim.cmd([[ colorscheme nord ]])
--vim.cmd([[ colorscheme base16-nord ]])
vim.cmd([[ colorscheme base16-gruvbox-dark-medium ]])
--vim.cmd([[ colorscheme base16-material-palenight ]])
--vim.cmd([[ colorscheme tokyonight ]])
--vim.cmd([[ ayu-dark ]])
