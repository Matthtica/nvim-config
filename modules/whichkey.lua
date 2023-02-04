local wk = require('which-key')
local tbuiltin = require('telescope.builtin')

local keymaps = {
    c = {
        name = "colorschemes",
        r = { ':colorscheme base16-gruvbox-dark-medium<CR>', 'gruvbox-dark-medium' },
        g = { ':colorscheme gruvbox<CR>', 'gruvbox' },
        p = { ':colorscheme palenight<CR>', 'palenight' },
        m = { ':colorscheme base16-material-palenight<CR>', 'material-palenight' },
        o = { ':colorscheme onedark<CR>', 'onedark' },
        n = { ':colorscheme nord<CR>', 'nord' },
        t = { ':colorscheme tokyonight<CR>', 'tokyonight' },
        e = { ':colorscheme everforest<CR>', 'everforest' },
        v = { ':colorscheme base16-black-metal-venom<CR>', 'black-metal-venom' },
        d = { ':colorscheme base16-nord<CR>', 'base16-nord' },
    },
    d = { ':bdelete<CR>', 'BufferDelete' },
    f = {
        name = "f",
        f = { tbuiltin.find_files, 'Files'},
        g = { tbuiltin.live_grep, 'Ripgrep' },
        b = { ':BLines<CR>', 'BLines' },
        z = { ':FZF<CR>', 'FZF' },
    },
    r = { ':RnvimrToggle<CR>', 'ranger' },
    n = { ':NvimTreeToggle<CR>', 'NvimTree' },
    t = { ':Telescope<CR>', 'Telescope' },
    s = { ':w<CR>', 'Save' },
    q = { ':wq!<CR>', 'Save and quit' },
    h = { ':split<CR>', 'HorizontalSplit' },
    v = { ':vsplit<CR>', 'verticalSplig' },
    g = { '<Cmd>LazyGit<CR>', 'LazyGit' },
    m = { ':MarkdownPreviewToggle<CR>', 'MarkdownPreview' },
    p = {
        name = "vim-plug",
        i = { ':PlugInstall<CR>', 'plug-install' },
        u = { ':PlugUpdate<CR>', 'plug-update' },
        g = { ':PlugUpgrade<CR>', 'plug-upgrade' },
        c = { ':PlugClean<CR>', 'plug-clean' },
    },
    w = {
        name  = "windows",
        ['='] = { '<C-W>=', 'balance-window' },
        v     = { ':vsplit<CR>', 'split-vertical' },
        h     = { ':split<CR>', 'split-horizontal' },
        n     = { '<C-W>n', 'next-window' },
        d     = { '<C-W>c', 'delete-window' }
    }
}

wk.register(keymaps, { prefix = "<leader>" })

wk.setup {
    plugins = {
        marks = false, -- shows a list of your marks on ' and `
        registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}
