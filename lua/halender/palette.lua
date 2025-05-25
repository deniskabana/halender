---@mod halender.palette color palette
---
---@class (exact) HalenderPalette
---@field dark table<string,string>
---@field light table<string,string>

---@alias Palette HalenderPalette
---
local M = {}

---@type table<string,string>
M.dark = {
	purple = "#c3a6ff", -- Keywords, constants
	yellow = "#ffd580", -- Functions, classes, object literal keys
	orange = "#ffae57", -- Constants, operators
	lime = "#bae67e", -- Strings, MD headings
	cyan = "#5ccfe6", -- Special keywords, classes, markdown code
	silver = "#a2aabc", -- Variables, property names, tags
	pink = "#dc73f1", -- Arrows, braces, brackets
	blue = "#2e96ff", -- Types, properties
	blue2 = "#4EA3FF", -- Rainbow parentheses (a bit brighter than blue)
	gold = "#EFE24D", -- Punctuation, operators, template literals
	purple2 = "#9066ce", -- Env keywords (import, export, from)
	white = "#cfe3ef", -- Standout text
	red = "#ef6b73", -- Passive error, reminder
	red2 = "#cf2a2c", -- Error, requiring immediate action, destroy
	green = "#4aaa45",

	bg = "#1d2433",
	sidebar = "#171c28",
	float = "#171c28",
	black = "#070c18",
	fg = "#b2bacc",
	text = "#8695aa",
	comments = "#616d86",
	selection = "#2f3b54",
	contrast = "#171c28",
	border = "#515772",
	line_numbers = "#515d76",
	highlight = "#2f3b54",
	disabled = "#515772",
	cursor = "#a19bb5",
	accent = "#ffd580",
	error = "#cf3a3c",
	warning = "#EFE24D",
	info = "#5ccfe6",
	link = "#2e96ff",
}

---@type table<string,string>
M.light = {
	purple = "#a974f7", -- Keywords, constants
	yellow = "#efc26a", -- Functions, classes, object literal keys
	orange = "#ef9e67", -- Constants, operators
	lime = "#98d66e", -- Strings, MD headings
	cyan = "#5ccfe6", -- Special keywords, classes, markdown code
	silver = "#a2aabc", -- Variables, property names, tags
	pink = "#ec73f1", -- Arrows, braces, brackets
	blue = "#2186ff", -- Types, properties
	blue2 = "#44A0FC", -- Rainbow parentheses (a bit brighter than blue)
	gold = "#EFE24D", -- Punctuation, operators, template literals
	purple2 = "#9066ce", -- Env keywords (import, export, from)
	white = "#171c28", -- Standout text
	red = "#ef5b63", -- Passive error, reminder
	red2 = "#cf2a2c", -- Error, requiring immediate action, destroy
	green = "#4aaa45",

	bg = "#d2daf8",
	sidebar = "#b2bacc",
	float = "#b2bacc",
	black = "#b2bacc",
	fg = "#1d2433",
	text = "#171c28",
	comments = "#616d86",
	selection = "#d2daf8",
	contrast = "#d2daf8",
	border = "#515772",
	line_numbers = "#a1add6",
	highlight = "#616d86",
	disabled = "#515772",
	cursor = "#a19bb5",
	accent = "#ffd580",
	error = "#cf3a3c",
	warning = "#EFE24D",
	info = "#5ccfe6",
	link = "#2e96ff",
}

return M
