return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'windwp/nvim-ts-autotag'
    },
    config = function()
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
    end
}
