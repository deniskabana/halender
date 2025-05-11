---@mod halender.config plugin configuration

---@class (exact) HalenderOpts
---@field transparent? HalenderTransparentOpts
---@field contrast? boolean colour the sidebar and floating windows differently to the main background
---@field italic? HalenderItalicOpts
---@field signs? boolean use icon (patched font) diagnostic sign text

---@class (exact) HalenderTransparentOpts
---@field background? boolean do not render the main background
---@field float? boolean do not render the background in floating windows
---@field popup? boolean do not render the background in popup menus
---@field sidebar? boolean do not render the background in sidebars

---@class (exact) HalenderItalicOpts
---@field comments? boolean italic comments
---@field functions? boolean italic function names
---@field keywords? boolean italic keywords
---@field variables? boolean italic variables

---@type HalenderOpts
local M = {
  transparent = {
    background = false,
    float      = false,
    popup      = false,
    sidebar    = false,
  },
  contrast = true,

  italic = {
    comments  = true,
    functions = false,
    keywords  = true,
    variables = false,
  },

  signs = false,
}

-- Merge user-defined config
-- FIX: need to validate config!!
M = vim.tbl_deep_extend("force", M, vim.g.halender or {})

return M
