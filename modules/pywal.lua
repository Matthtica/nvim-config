local pywal = require('pywal')
pywal.setup()

local lualine = require('lualine')

lualine.setup {
    options = {
        theme = 'pywal-nvim',
    },
}
