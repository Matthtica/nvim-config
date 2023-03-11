return {
    'jose-elias-alvarez/null-ls.nvim',

    config = function()
        local nls = require("null-ls")

        nls.setup()
    end
}
