---@type HalenderOpts
local config    = require("halender.config")
---@type Highlights
local theme     = require("halender.theme")
local colors    = require("halender.colors")
---@type Palette
local hexcolors = require("halender.colors.hex")
local util      = require("halender.util")

local M         = {}

function M.load()
  -- Clear existing highlights only if a colorscheme has been set
  if vim.g.colors_name then
    if vim.g.colors_name == "Halender" then
      return
    end

    vim.cmd("highlight clear")
    vim.cmd("colorscheme vim")
  end
  vim.o.termguicolors = true
  vim.o.background    = "dark"
  vim.g.colors_name   = "Halender"

  -- Load terminal colours
  util.hl_terminal(hexcolors)
  -- Load main highlights
  util.apply_theme(theme, colors)
  -- Load diagnostic signs
  if config.signs then
    util.diagnostic_signs()
  end
  -- Define autocommands
  util.autocmds()
end

return M
