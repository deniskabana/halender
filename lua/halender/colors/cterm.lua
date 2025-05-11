---@mod halender.colors.cterm colour mappings for cterm

-- These mappings are best-effort, and generated from the hex colours based
-- on closeness to the standard 256-color palette by the CIEDE2000 metric.
-- See src/HexToCterm

---@alias ANSIPalette table<string,integer>

---@type HalenderOpts
local config = require("halender.config")

---@type ANSIPalette
local M = {
  -- HexToCterm: START
  lightblue = 152,   -- #afd7d7
  paleblue = 254,    -- #e4e4e4
  white = 195,       -- #d7ffff
  red = 210,         -- #ff8787
  red2 = 210,        -- #ff8787
  orange = 216,      -- #ffaf87
  yellow = 222,      -- #ffd787
  green2 = 79,       -- #5fd7af
  green = 50,        -- #00ffd7
  cyan = 51,         -- #00ffff
  blue = 45,         -- #00d7ff
  blue2 = 75,        -- #5fafff
  purple2 = 141,     -- #af87ff
  purple3 = 140,     -- #af87d7
  purple = 147,      -- #afafff
  pink = 219,        -- #ffafff
  pink2 = 211,       -- #ff87af

  bg = 235,          -- #262626
  bg_alt = 234,      -- #1c1c1c
  fg = 255,          -- #eeeeee
  text = 103,        -- #8787af
  comments = 104,    -- #8787d7
  selection = 60,    -- #5f5f87
  contrast = 234,    -- #1c1c1c
  border = 60,       -- #5f5f87
  line_numbers = 61, -- #5f5faf
  highlight = 147,   -- #afafff
  disabled = 60,     -- #5f5f87
  cursor = 146,      -- #afafd7
  accent = 147,      -- #afafff
  error = 204,       -- #ff5f87
  link = 116,        -- #87d7d7
  -- HexToCterm: END
}

if config.contrast then
  M.sidebar = M.bg_alt
  M.float   = M.bg_alt
else
  M.sidebar = M.bg
  M.float   = M.bg
end

-- Merge user-defined config
-- M = vim.tbl_extend("force", M, config.overrides.colors.cterm or {})

return M
