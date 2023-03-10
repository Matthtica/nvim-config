return {
    'L3MON4d3/LuaSnip',

    dependencies = {
        'rafamadriz/friendly-snippets',
    },

    version = "<CurrentMajor>.*",

    build = "make install_jsregexp",

    config = function()
        local ls = require("luasnip")

        require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

        ls.config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",
            enable_autosnippets = true,
        })

        vim.keymap.set({"i", "s"}, "<A-l>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end)

        vim.keymap.set({ "i", "s" }, "<A-h>", function ()
            if ls.choice_active() then
                ls.change_choice(-1)
            end
        end)
    end
}
