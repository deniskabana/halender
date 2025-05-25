---@type HalenderOpts
local config = require("halender.config")
---@type Highlights
local theme = require("halender.theme")
---@type Palette
local palette = require("halender.palette")
local util = require("halender.util")

local M = {}

function M.load(variant)
	variant = variant or "dark"

	-- Clear existing highlights only if a colorscheme has been set
	if vim.g.colors_name then
		if vim.g.colors_name == "Halender" or vim.g.colors_name == "Halender Daylight" then
			return
		end

		vim.cmd("highlight clear")
		vim.cmd("colorscheme vim")
	end
	vim.o.termguicolors = true
	vim.o.background = variant
	vim.g.colors_name = variant == "light" and "Halender Daylight" or "Halender"

	-- Load terminal colours
	util.hl_terminal(variant == "light" and palette.light or palette.dark)
	-- Load main highlights
	util.apply_theme(theme, variant == "light" and palette.light or palette.dark)
	-- Load diagnostic signs
	if config.signs then
		util.diagnostic_signs()
	end
	-- Define autocommands
	util.autocmds()
end

return M
