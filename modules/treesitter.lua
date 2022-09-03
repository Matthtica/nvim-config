require('nvim-treesitter.configs').setup {

    sync_install = false,

    ignore_install = { "" },

    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlight = true,
    },
    autotag = {
        enable = true,
    },
    indent = {
        enable = true,

        disable = { "cpp" }
    }
}
