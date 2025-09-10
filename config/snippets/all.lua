-- This is the `get_visual` function I've been talking about.
-- ----------------------------------------------------------------------------
-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end
-- ----------------------------------------------------------------------------

return {
  -- -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  -- s(
  --   { trig = "hi" },
  --   { t("Hello, world!") }
  -- ),
  --
  -- -- To return multiple snippets, use one `return` statement per snippet file
  -- -- and return a table of Lua snippets.
  -- s(
  --   {
  --     trig = "foo",
  --     snippetType = "autosnippet",
  --   },
  --   { t("Another snippet.") }
  -- ),
  --
  -- s("bar",
  --   { t({"Bebe,", "cair e", "levantar"}), }),
  --
  -- s({trig = "begin", snippetType = "autosnippet"},
  --   fmta(
  --       [[
  --         \begin{<>}
  --           <>
  --         \end{<>}
  --       ]],
  --       { i(1), i(2), rep(1) })),
  --
  -- s("eq",
  --   fmta(
  --       [[
  --         \begin{equation}
  --           <>
  --         \end{equation}
  --       ]],
  --       { i(0) })),
  --
  -- s("frac",
  --   fmta(
  --       "\\frac{<>}{<>}",
  --       { i(1, "place"), i(2, "holder"), })),
  --
  -- s("tb",
  --   fmta("\\textbf{<>}", { d(1, get_visual) })),
}
