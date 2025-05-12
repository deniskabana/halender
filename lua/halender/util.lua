---@mod halender.util utility functions

local M = {}

---Load main theme highlights
---@param theme Highlights halender.theme
---@param palette Palette halender.colors
function M.apply_theme(theme, palette)
  for group, hl in pairs(theme) do
    local fg_name = hl.fg
    local bg_name = hl.bg
    local ctermfg_name = hl.ctermfg
    local ctermbg_name = hl.ctermbg

    if palette[fg_name] ~= nil then
      hl.fg = palette[fg_name]
    elseif fg_name == "NONE" and ctermfg_name == nil then
      hl.ctermfg = fg_name
    end

    if palette[bg_name] ~= nil then
      hl.bg = palette[bg_name]
    elseif bg_name == "NONE" and ctermbg_name == nil then
      hl.ctermbg = bg_name
    end

    if palette[hl.sp] ~= nil then
      hl.sp = palette[hl.sp]
    end

    vim.api.nvim_set_hl(0, group, hl)
  end
end

---Load terminal colours
---@param c Palette halender.colors
function M.hl_terminal(c)
  vim.g.terminal_color_0  = c.black
  vim.g.terminal_color_8  = c.highlight

  vim.g.terminal_color_1  = c.red
  vim.g.terminal_color_9  = c.red

  vim.g.terminal_color_2  = c.green
  vim.g.terminal_color_10 = c.green

  vim.g.terminal_color_3  = c.yellow
  vim.g.terminal_color_11 = c.yellow

  vim.g.terminal_color_4  = c.blue
  vim.g.terminal_color_12 = c.blue

  vim.g.terminal_color_5  = c.purple
  vim.g.terminal_color_13 = c.purple

  vim.g.terminal_color_6  = c.cyan
  vim.g.terminal_color_14 = c.cyan

  vim.g.terminal_color_7  = c.white
  vim.g.terminal_color_15 = c.white
end

---Load icon diagnostic signs
function M.diagnostic_signs()
  local sev = vim.diagnostic.severity
  vim.diagnostic.config {
    signs = {
      text = {
        [sev.ERROR] = "",
        [sev.WARN]  = "",
        [sev.INFO]  = "󰋽",
        [sev.HINT]  = "󰌶",
      }
    }
  }
end

---Define autocommands
function M.autocmds()
  local group = vim.api.nvim_create_augroup("halender", { clear = true })

  -- Clear autocommands when loading a colorscheme
  -- (mostly useful when loading other colorschemes)
  vim.api.nvim_create_autocmd("ColorSchemePre", {
    group = group,
    callback = function() vim.api.nvim_del_augroup_by_id(group) end,
  })

  -- Window local backgrounds
  local alt_hl = "Normal:NormalFloat,SignColumn:NormalFloat"
  vim.api.nvim_create_autocmd("TermOpen", {
    group = group,
    callback = function() vim.wo.winhighlight = alt_hl end
  })
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "packer", "qf" },
    callback = function() vim.wo.winhighlight = alt_hl end
  })
end

return M
