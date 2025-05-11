---@mod lualine.themes.halender halender lualine theme

---@type table<string,table<string, string>>
local M = {
  normal = {
    a = "LualineNormalA",
    b = "LualineNormalB",
    c = "LualineNormalC",
  },

  insert = {
    a = "LualineInsertA",
    b = "LualineInsertB",
  },

  visual = {
    a = "LualineVisualA",
    b = "LualineVisualB",
  },

  replace = {
    a = "LualineReplaceA",
    b = "LualineReplaceB",
  },

  command = {
    a = "LualineCommandA",
    b = "LualineCommandB",
  },

  inactive = {
    a = "LualineInactiveA",
    b = "LualineInactiveB",
    c = "LualineInactiveC",
  },
}

return M
