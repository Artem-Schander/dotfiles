local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix

-- NOTE: See the official docs of LuaSnip
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#lua

return {
    s("vdd", { t("var_dump("), i(1), t("); die;") }),
    s({ trig = "pfunc", name = "Public Function" }, {
        t({"/**"}),
        t({"", " * "}), i(1, "describe what your function does"),
        t({"", " *"}),
        t({"", " * @return "}), i(2, "void"),
        t({"", " */"}),
        t({"", "public function "}), i(3, "doSomething"), t({"("}), i(4), t({")"}),
        t({"", "{"}),
        t({"", "    "}), i(0, "//"),
        t({"", "}"}),
    }),
    s({ trig = "printr", name = "Print Inside Pre Tags" }, {
        t({"echo '<pre>';"}),
        t({"", "print_r("}), i(1), t({");"}),
        t({"", "echo '</pre>';", ""}),
        i(0, "die;"),
    }),
}
