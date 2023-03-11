local M = {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'onsails/lspkind.nvim',
        'hrsh7th/cmp-calc',
        'L3MON4d3/LuaSnip',
        'saadparwaiz1/cmp_luasnip'
    }
}

function M.config()
    local cmp = require('cmp')
    local compare = require('cmp.config.compare')
    local luasnip = require('luasnip')

    local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    local lspkind = require("lspkind")

    local keys = {}

    for i = 1, 10, 1 do
        local key = table.concat({ "<M-", (i < 10 and i or 0), ">" })
        keys[key] = function(fallback)
            if cmp.visible() then
                return cmp.select_next_item({ count = i - 1 })
            end
            fallback()
        end
    end

    cmp.setup {
        formatting = {
            format = function(entry, vim_item)
                -- fancy icons and a name of kind
                vim_item.kind = lspkind.presets.default[vim_item.kind]
                -- set a name for each source
                vim_item.menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[snippet]",
                    nvim_lua = "[Lua]",
                    cmp_tabnine = "[TabNine]",
                    look = "[Look]",
                    path = "[Path]",
                    spell = "[Spell]",
                    calc = "[Calc]",
                    emoji = "[Emoji]"
                })[entry.source.name]
                return vim_item
            end
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        --mapping = {
        --    ['<C-p>'] = cmp.mapping.select_prev_item(),
        --    ['<C-n>'] = cmp.mapping.select_next_item(),
        --    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        --    ['<C-f>'] = cmp.mapping.scroll_docs(4),
        --    ['<C-Space>'] = cmp.mapping.complete(),
        --    ['<C-s>'] = cmp.mapping {
        --        i = cmp.mapping.abort(),
        --        c = cmp.mapping.close(),
        --    },
        --    ['<CR>'] = cmp.mapping.confirm({ select = true }),
        --    ["<Tab>"] = cmp.mapping(function(fallback)
        --        if cmp.visible() then
        --            cmp.select_next_item()
        --        elseif luasnip.expand_or_jumpable() then
        --            luasnip.expand_or_jump()
        --        elseif has_words_before() then
        --            cmp.complete()
        --        else
        --            fallback()
        --        end
        --    end, { "i", "s" }),
        --    ["<S-Tab"] = cmp.mapping(function(fallback)
        --        if cmp.visible() then
        --            cmp.select_prev_item()
        --        elseif luasnip.jumpable(-1) then
        --            luasnip.jump(-1)
        --        else
        --            fallback()
        --        end
        --    end, { "i", "s" }),
        --},
        mapping = keys,
        sources = {
            {name = 'nvim_lsp'},
            {name = 'luasnip'},
            {name = 'path'},
            {name = 'cmp_tabnine'},
            {name = 'calc'},
        },
        completion = {completeopt = 'menu,menuone,noinsert'},
        -- sorting = {
        --     priority_weight = 1,
        --     comparators = {
        --         require('cmp_tabnine.compare'),
        --         compare.score,
        --         compare.exact,
        --         compare.recently_used,
        --         compare.order,
        --         compare.offset,
        --         compare.kind,
        --         compare.sort_text,
        --         compare.length,
        --     },
        -- },
        experimental = {
            ghost_text = true,
            native_menu = false,
        },
    }
end

return M
