---@mod halender.config plugin configuration

---@class (exact) HalenderOpts
---@field transparent? HalenderTransparentOpts
---@field italic? HalenderItalicOpts
---@field dim_inactive? boolean dim inactive editors
---@field signs? boolean use icon (patched font) diagnostic sign text
---@field disable_semantic_highlighting? boolean disable LSP semantic highlighting
---@field enable_bold? boolean allows using bold fonts

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
---@field builtins? boolean italic builtin libs/methods

---@type HalenderOpts
local M = {
	transparent = {
		background = false,
		float = false,
		popup = false,
		sidebar = false,
	},

	italic = {
		comments = true,
		functions = false,
		keywords = true,
		variables = false,
		strings = true,
		types = true,
		function_call = false,
		builtins = true,
	},

	dim_inactive = true,

	enable_bold = true,

	disable_semantic_highlighting = false,

	signs = true,
}

return M
