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
	lime = "#a7d963", -- Strings, MD headings
	cyan = "#5ccfe6", -- Special keywords, classes, markdown code
	silver = "#a2aabc", -- Variables, property names, tags
	pink = "#dc73f1", -- Arrows, braces, brackets
	blue = "#2190f0", -- Types, properties
	blue2 = "#2Ea3FF", -- Rainbow parentheses (a bit brighter than blue)
	gold = "#EFE24D", -- Punctuation, operators, template literals
	purple2 = "#9066ce", -- Env keywords (import, export, from)
	white = "#cfe3ef", -- Standout text
	red = "#ef6b73", -- Passive error, reminder
	red2 = "#cf2a2c", -- Error, requiring immediate action, destroy
	green = "#4aaa45",

	bg = "#1a253d",
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
	cursor = "#dc73f1",
	accent = "#ffd580",
	error = "#cf3a3c",
	warning = "#EFE24D",
	info = "#4aaa45",
	link = "#2e96ff",
}

---@type table<string,string>
M.light = {
	purple = "#9a40b3", -- Keywords, constants
	yellow = "#907002", -- Functions, classes, object literal keys
	orange = "#bf4030", -- Constants, operators
	lime = "#339425", -- Strings, MD headings
	cyan = "#007ac5", -- Special keywords, classes, markdown code
	silver = "#a2aabc", -- Variables, property names, tags
	pink = "#bc42ba", -- Arrows, braces, brackets
	blue = "#0010b5", -- Types, properties
	blue2 = "#2590EC", -- Rainbow parentheses (a bit brighter than blue)
	gold = "#c98005", -- Punctuation, operators, template literals
	purple2 = "#6f1f7f", -- Env keywords (import, export, from)
	white = "#171c28", -- Standout text
	red = "#cf2a2c", -- Passive error, reminder
	red2 = "#cf2a2c", -- Error, requiring immediate action, destroy
	green = "#4aaa45",

	bg = "#d7dff5",
	sidebar = "#c9d4ea",
	float = "#cad9ed",
	black = "#cad9ed",
	fg = "#223949",
	text = "#223949",
	comments = "#818da6",
	selection = "#b2bacc",
	contrast = "#d2daf8",
	border = "#515772",
	line_numbers = "#a1add6",
	highlight = "#c7cfe5",
	disabled = "#818da6",
	cursor = "#a19bb5",
	accent = "#b29328",
	error = "#cf2a2c",
	warning = "#cfa03a",
	info = "#0070c3",
	link = "#002fc0",
}

return M
