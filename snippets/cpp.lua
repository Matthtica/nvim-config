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

-- begend: -----------------------------------------------------------
local begend = s("begend", fmt([[
{}.begin(), {}.end()
]], {
        i(1, "container"),
        rep(1)
    }))
table.insert(snippets, begend)


-- fori: -----------------------------------------------------------
--local fori = s({ trig = "for([%w_]+)", regTrig = true }, fmt([[
--for (let {} = 0; {} < {}; ++{}) {{
--    {}
--}}
--{}
--]], {
--        d(1, function(_, snip)
--            return sn(1, i(1, snip.captures[1]))
--        end),
--        rep(1),
--        c(2, { i(1, "num"), sn(1, { i(1, "arr"), t(".size()") }) }),
--        rep(1),
--        i(3, "// TODO:"),
--        i(4),
--    }))
--table.insert(autosnippets, fori)


return snippets, autosnippets
