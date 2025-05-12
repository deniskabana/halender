---@mod halender.config plugin configuration

---@class (exact) HalenderOpts
---@field transparent? HalenderTransparentOpts
---@field italic? HalenderItalicOpts
---@field dim_inactive? boolean dim inactive editors
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
---@field strings? boolean italic strings
---@field types? boolean italic types
---@field function_call? boolean italic function calls

---@type HalenderOpts
local M = {
  transparent = {
    background = false,
    float      = false,
    popup      = false,
    sidebar    = false,
  },

  dim_inactive = true,

  italic = {
    comments      = true,
    functions     = false,
    keywords      = true,
    variables     = false,
    strings       = true,
    types         = true,
    function_call = true,
  },

  signs = true,
}

return M
