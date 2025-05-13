---@mod halender.palette color palette

---@alias Palette table<string,string>

---@type Palette
local M = {
  purple       = "#c3a6ff", -- Keywords, constants
  yellow       = "#ffd580", -- Functions, classes, object literal keys
  orange       = "#ffae57", -- Constants, operators
  lime         = "#bae67e", -- Strings, MD headings
  cyan         = "#5ccfe6", -- Special keywords, classes, markdown code
  silver       = "#a2aabc", -- Variables, property names, tags
  pink         = "#dc73f1", -- Arrows, braces, brackets
  blue         = "#2e96ff", -- Types, properties
  blue2        = "#618aF0",
  gold         = "#EFE24D", -- Punctuation, operators, template literals
  purple2      = "#9066ce", -- Env keywords (import, export, from)
  white        = "#cfe3ef", -- Standout text
  red          = "#ef6b73", -- Passive error, reminder
  red2         = "#cf2a2c", -- Error, requiring immediate action, destroy
  green        = "#4aaa45",

  bg           = "#1d2433",
  sidebar      = "#171c28",
  float        = "#171c28",
  black        = "#070c18",
  fg           = "#a2aabc",
  text         = "#8695aa",
  comments     = "#515d76",
  selection    = "#2f3b54",
  contrast     = "#171c28",
  border       = "#515772",
  line_numbers = "#515d76",
  highlight    = "#2f3b54",
  disabled     = "#515772",
  cursor       = "#a19bb5",
  accent       = "#ffd580",
  error        = "#cf2a2c",
  warning      = "#ffae57",
  info         = "#5ccfe6",
  link         = "#2e96ff",
}

return M
