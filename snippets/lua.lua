local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"

local myFirstSnippet = s("my-first-snippet", {
    t("Hi! That is my second snippet in luasnip"),
    i(1, " placeholder_text"),
    t({ "", "this is another text node"}),
})

local second = s("my-second-snippet", fmt([[
local {} = function({})
{} {{ I'm in a curly braces }}
end
]], {
        i(1, ""),
        c(2, { t("One"), t("Two"), t("Three") }),
        i(3, ""),
    }))

table.insert(snippets, myFirstSnippet)
table.insert(snippets, second)

return snippets, autosnippets
