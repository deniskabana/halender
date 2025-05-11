---@alias Palette table<string,string>

-- https://en.wikipedia.org/wiki/X11_color_names
---@type Palette
local M = {
  -- Syntax colors (Main)
  purple       = "#c3a6ff", -- Keywords, constants
  yellow       = "#ffd580", -- Functions, classes, object literal keys
  orange       = "#ffae57", -- Constants, operators
  lime         = "#bae67e", -- Strings, MD headings
  cyan         = "#5ccfe6", -- Special keywords, classes, markdown code
  silver       = "#a2aabc", -- Variables, property names, tags
  pink         = "#dc73f1", -- Arrows, braces, brackets
  blue         = "#2e96ff", -- Types, properties
  gold         = "#efe24d", -- Punctuation, operators, template literals
  purple2      = "#9066ce", -- Env keywords (import, export, from)
  white        = "#d7dce2",
  red          = "#ef6b73",

  -- UI Colors
  bg           = "#1d2433",
  sidebar      = "#171c28",
  float        = "#171c28",
  fg           = "#a2aabc",
  text         = "#8695b7",
  comments     = "#515d76",
  selection    = "#2f3b54",
  contrast     = "#171c28",
  border       = "#6679a4",
  line_numbers = "#515d76",
  highlight    = "#2f3b54",
  disabled     = "#515772",
  cursor       = "#a19bb5",
  accent       = "#ffd580",
  error        = "#ef6b73",
  warning      = "#ffd580",
  info         = "#5ccfe6",
  link         = "#ffcc66"
}

return M
