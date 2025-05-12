---@mod halender.theme highlight definitions

---@type HalenderOpts
local config = require("halender.config")

---:help nvim_set_hl
---@class (exact) Highlight
---@field fg? string foreground - name of a colour defined in halender.colors.hex
---@field bg? string background - name of a colour as above
---@field sp? string special - name of a colour as above
---@field blend? integer between 0 and 100
---@field bold? boolean
---@field standout? boolean
---@field underline? boolean
---@field undercurl? boolean
---@field underdouble? boolean
---@field underdotted? boolean
---@field underdashed? boolean
---@field strikethrough? boolean
---@field italic? boolean
---@field reverse? boolean swaps fg and bg, increases priority of the group - see below
---@field nocombine? boolean
---@field link? string another highlight group to link to :help highlight-link
---@field default? boolean :help highlight-default
---@field ctermfg? integer | string foreground of cterm color - :help ctermfg
---@field ctermbg? integer | string background of cterm color - :help ctermbg
---@field cterm? string cterm attribute map - :help highlight-args
---@field force? boolean

-- reverse:
-- https://old.reddit.com/r/vim/comments/ga4xe0/why_use_reverse_for_tui_highlights/foxlzha/

---@alias Highlights table<string,Highlight>

---@type Highlights
local M = {
  ColorColumn                           = { bg = "border" },                    -- used for the columns set with 'colorcolumn'
  Conceal                               = { fg = "disabled" },                  -- placeholder characters substituted for concealed text (see 'conceallevel')
  Cursor                                = { bg = "red" },                       -- character under the cursor
  lCursor                               = { link = "Cursor" },                  -- the character under the cursor when |language-mapping| is used (see 'guicursor')
  CursorIM                              = { link = "Cursor" },                  -- like Cursor, but used when in IME mode |CursorIM|
  CursorColumn                          = { bg = "border" },                    -- Screen-column at the cursor, when 'cursorcolumn' is set.
  CursorLine                            = { bold = true, bg = "highlight" },    -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
  Directory                             = { fg = "cyan" },                      -- directory names (and other special names in listings)
  DiffAdd                               = { fg = "lime", reverse = true },      -- diff mode: Added line |diff.txt|
  DiffChange                            = { fg = "orange", reverse = true },    -- diff mode: Changed line |diff.txt|
  DiffDelete                            = { fg = "red", reverse = true },       -- diff mode: Deleted line |diff.txt|
  DiffText                              = { fg = "selection", reverse = true }, -- diff mode: Changed text within a changed line |diff.txt|
  EndOfBuffer                           = { fg = "border" },                    -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
  -- TermCursor = {}, -- cursor in a focused terminal
  -- TermCursorNC = {}, -- cursor in an unfocused terminal
  Comment                               = { fg = "comments", italic = config.italic.comments }, -- any comment
  ErrorMsg                              = { fg = "error" },                                     -- error messages on the command line
  VertSplit                             = { fg = "border" },                                    -- the column separating vertically split windows
  WinSeparator                          = { link = "VertSplit" },                               -- the column separating vertically split windows
  Folded                                = { fg = "disabled", italic = true },                   -- line used for closed folds
  FoldColumn                            = { fg = "accent" },                                    -- 'foldcolumn'
  SignColumn                            = { link = "Normal" },                                  -- column where |signs| are displayed
  -- SignColumnSB = {}, -- column where |signs| are displayed
  -- Substitute = {}, -- |:substitute| replacement text highlighting
  LineNr                                = { fg = "line_numbers" },                       -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  CursorLineNr                          = { fg = "fg", bold = true },                    -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
  MatchParen                            = { reverse = true, bold = config.enable_bold }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
  ModeMsg                               = { fg = "fg" },                                 -- 'showmode' message (e.g., "-- INSERT -- ")
  MsgArea                               = { fg = "fg" },                                 -- Area for messages and cmdline
  -- MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
  -- MoreMsg = {}, -- |more-prompt|
  NonText                               = { fg = "disabled" },           -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
  Normal                                = { fg = "fg", bg = "bg" },      -- normal text
  -- NormalNC = {}, -- normal text in non-current windows
  NormalSB                              = { fg = "fg", bg = "sidebar" }, -- normal text in sidebar
  NormalFloat                           = { fg = "fg", bg = "float" },   -- Normal text in floating windows.
  FloatBorder                           = { fg = "border", bg = "float" },
  -- FloatTitle = {},
  Pmenu                                 = { fg = "text", bg = "contrast" },                                -- Popup menu: normal item.
  PmenuSel                              = { bg = "border" },                                               -- Popup menu: selected item.
  PmenuSbar                             = { fg = "text", bg = "contrast" },                                -- Popup menu: scrollbar.
  PmenuThumb                            = { fg = "fg", bg = "accent" },                                    -- Popup menu: Thumb of the scrollbar.
  Question                              = { fg = "purple2" },                                              -- |hit-enter| prompt and yes/no questions
  QuickFixLine                          = { fg = "highlight", italic = true },                             -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
  Search                                = { fg = "contrast", bold = true, bg = "pink", nocombine = true }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
  IncSearch                             = { link = "Search" },                                             -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
  CurSearch                             = { link = "IncSearch" },
  SpecialKey                            = { link = "SpecialChar" },                                        -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
  SpellBad                              = { sp = "error", undercurl = true },                              -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
  SpellCap                              = { sp = "cyan", undercurl = true },                               -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
  SpellLocal                            = { sp = "yellow", undercurl = true },                             -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
  SpellRare                             = { sp = "purple", undercurl = true },                             -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
  StatusLine                            = { fg = "fg", bg = "sidebar", },                                  -- status line of current window
  StatusLineNC                          = { fg = "disabled", bg = "sidebar" },                             -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
  TabLine                               = { fg = "white" },                                                -- tab pages line, not active tab page label
  TabLineFill                           = {},                                                              -- tab pages line, where there are no labels
  TabLineSel                            = { fg = "bg", bg = "accent" },                                    -- tab pages line, active tab page label
  Title                                 = { fg = "lime", bold = config.enable_bold },                      -- titles for output from ":set all", ":autocmd" etc.
  Visual                                = { bg = "selection" },                                            -- Visual mode selection
  VisualNOS                             = { link = "Visual" },                                             -- Visual mode selection when vim is "Not Owning the Selection".
  WarningMsg                            = { fg = "orange" },                                               -- warning messages
  Whitespace                            = { link = "NonText" },                                            -- "nbsp", "space", "tab" and "trail" in 'listchars'
  WildMenu                              = { fg = "red", bold = config.enable_bold },                       -- current match in 'wildmenu' completion
  WinBar                                = { link = "StatusLine" },                                         -- window bar
  WinBarNC                              = { link = "StatusLineNC" },                                       -- window bar in inactive windows

  -- These groups are not listed as default vim groups,
  -- but they are defacto standard group names for syntax highlighting.
  -- commented out groups should chain up to their "preferred" group by
  -- default,
  -- Uncomment and edit if you want more specific syntax highlighting.

  Constant                              = { fg = "fg", bold = config.enable_bold },                         -- (preferred) any constant
  String                                = { fg = "lime", italic = config.italic.strings },                  -- a string constant: "this is a string"
  Character                             = { fg = "purple2" },                                               -- a character constant: 'c', '\n'
  Number                                = { fg = "purple", bold = config.enable_bold },                     -- a number constant: 234, 0xff
  Boolean                               = { fg = "purple", bold = config.enable_bold },                     -- a boolean constant: TRUE, false
  Float                                 = { fg = "purple", bold = config.enable_bold },                     -- a floating point constant: 2.3e10

  Identifier                            = { fg = "cyan", italic = config.italic.variables },                -- (preferred) any variable name
  Function                              = { fg = "yellow", bold = config.enable_bold },                     -- function name (also: methods for classes)

  Statement                             = { fg = "pink" },                                                  -- (preferred) any statement
  Conditional                           = { fg = "orange", italic = false, bold = config.enable_bold },     -- if, then, else, endif, switch, etc.
  Repeat                                = { fg = "purple", italic = config.italic.keywords },               -- for, do, while, etc.
  Label                                 = { fg = "orange", bold = config.enable_bold },                     -- case, default, etc.
  Operator                              = { link = "Label" },                                               -- "sizeof", "+", "*", etc.
  Keyword                               = { fg = "purple", bold = false, italic = config.italic.keywords }, -- any other keyword
  Exception                             = { link = "Label" },                                               -- try, catch, throw

  PreProc                               = { fg = "purple" },                                                -- (preferred) generic Preprocessor
  Include                               = { fg = "purple2", bold = config.enable_bold },                    -- preprocessor #include
  Define                                = { fg = "pink" },                                                  -- preprocessor #define
  Macro                                 = { fg = "pink" },                                                  -- same as Define
  PreCondit                             = { fg = "purple" },                                                -- preprocessor #if, #else, #endif, etc.

  Type                                  = { fg = "blue" },                                                  -- (preferred) int, long, char, etc.
  -- StorageClass = {}, -- static, register, volatile, etc.
  -- Structure = {}, -- struct, union, enum, etc.
  Typedef                               = { fg = "yellow" },              -- A typedef
  Special                               = { fg = "pink", italic = true }, -- (preferred) any special symbol
  -- SpecialChar = {}, -- special character in a constant
  -- Tag = {}, -- you can use CTRL-] on this
  Delimiter                             = { fg = "accent" },    -- character that needs attention
  SpecialComment                        = { fg = "text" },      -- special things inside a comment
  Debug                                 = { fg = "orange" },    -- debugging statements

  Underlined                            = { underline = true }, -- (preferred) text that stands out, HTML links
  Bold                                  = { bold = true },
  Italic                                = { italic = true },

  -- ("Ignore", below, may be invisible...)
  Ignore                                = { fg = "disabled" },                             -- (preferred) left blank, hidden  |hl-Ignore|
  Error                                 = { fg = "error", bold = true, undercurl = true }, -- (preferred) any erroneous construct
  Todo                                  = { fg = "gold", bold = true, italic = true },     -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  -- These groups are for the native LSP client. Some other LSP clients may
  -- use these groups, or use their own. Consult your LSP client's
  -- documentation.
  LspReferenceText                      = { bg = "highlight" }, -- used for highlighting "text" references
  LspReferenceRead                      = { bg = "highlight" }, -- used for highlighting "read" references
  LspReferenceWrite                     = { bg = "highlight" }, -- used for highlighting "write" references
  LspInlayHint                          = { link = "Comment" },

  DiagnosticError                       = { fg = "error" },                     -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticWarn                        = { fg = "warning" },                   -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticInfo                        = { fg = "info" },                      -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticHint                        = { fg = "lime" },                      -- Used as the base highlight group. Other Diagnostic highlights link to this by default
  DiagnosticUnnecessary                 = { fg = "comments" },                  -- Used as the base highlight group. Other Diagnostic highlights link to this by default

  DiagnosticVirtualTextError            = { fg = "error", italic = true },      -- Used for "Error" diagnostic virtual text
  DiagnosticVirtualTextWarn             = { fg = "warning", italic = true },    -- Used for "Warning" diagnostic virtual text
  DiagnosticVirtualTextInfo             = { fg = "cyan", italic = true },       -- Used for "Information" diagnostic virtual text
  DiagnosticVirtualTextHint             = { fg = "purple", italic = true },     -- Used for "Hint" diagnostic virtual text

  DiagnosticUnderlineError              = { sp = "error", undercurl = true },   -- Used to underline "Error" diagnostics
  DiagnosticUnderlineWarn               = { sp = "warning", undercurl = true }, -- Used to underline "Warning" diagnostics
  DiagnosticUnderlineInfo               = { sp = "cyan", undercurl = true },    -- Used to underline "Information" diagnostics
  DiagnosticUnderlineHint               = { sp = "purple", undercurl = true },  -- Used to underline "Hint" diagnostics

  LspSignatureActiveParameter           = { bold = true },
  LspCodeLens                           = { italic = true },
  NavicText                             = { fg = "comments", italic = true },

  ALEErrorSign                          = { link = "DiagnosticError" },
  ALEWarningSign                        = { link = "DiagnosticWarn" },

  DapStoppedLine                        = { bg = "yellow" }, -- Used for "Warning" diagnostic virtual text

  -- nvim-tree/nvim-tree
  NvimTreeNormal                        = { fg = "white", bg = "sidebar", bold = false },

  -- nvim-treesitter/nvim-treesitter
  ["@none"]                             = { nocombine = true },
  ["@annotation"]                       = { fg = "red" },
  ["@attribute"]                        = { fg = "yellow" },

  --- Text
  ["@comment"]                          = { link = "Comment" },
  ["@comment.error"]                    = { fg = "error", italic = config.italic.comments },
  ["@comment.warning"]                  = { fg = "orange", italic = config.italic.comments, bold = true },
  ["@comment.info"]                     = { fg = "cyan", italic = config.italic.comments },
  ["@comment.hint"]                     = { fg = "purple", italic = config.italic.comments },
  ["@comment.note"]                     = { link = "@comment.hint" },
  ["@comment.todo"]                     = { fg = "gold", italic = config.italic.comments },
  ["@comment.documentation"]            = { link = "Comment" },

  ["@punctuation"]                      = { fg = "orange", bold = config.enable_bold }, -- For delimiters ie: `.`
  ["@punctuation.bracket"]              = { fg = "blue", bold = config.enable_bold },   -- For brackets and parens.
  ["@punctuation.special"]              = { fg = "pink", bold = config.enable_bold },   -- For special symbols (e.g. `{}` in string interpolation)
  -- ["@punctuation.delimiter"]            = { fg = "blue", bold = config.enable_bold }, -- For delimiters ie: `.`

  --- Literals
  ["@constant"]                         = { link = "Constant" },
  ["@constant.builtin"]                 = { fg = "purple", bold = true },
  ["@constant.macro"]                   = { link = "Macro" },
  ["@string"]                           = { link = "String" },
  ["@string.special.url"]               = { fg = "link", underline = true },
  ["@string.escape"]                    = { fg = "purple2" }, -- For escape characters within a string.
  ["@string.regexp"]                    = { fg = "purple" },  -- For regexes.
  ["@character"]                        = { link = "Character" },
  ["@character.special"]                = { link = "SpecialChar" },
  ["@number"]                           = { link = "Number" },
  ["@number.float"]                     = { link = "Float" },
  ["@boolean"]                          = { link = "Boolean" },

  --- Functions
  ["@function"]                         = { link = "Function" },
  ["@function.builtin"]                 = { fg = "cyan", nocombine = true },
  ["@function.call"]                    = { bold = true, nocombine = true, fg = "yellow", italic = true },
  ["@function.macro"]                   = { link = "Macro" },
  ["@function.method"]                  = { bold = true },
  ["@function.method.call"]             = { link = "@function.call" },
  ["@property"]                         = { link = "Identifier" },
  ["@constructor"]                      = {}, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
  ["@constructor.tsx"]                  = {},

  --- Keywords
  -- ["@label"] = { link = "Label" }, -- For labels: `label:` in C and `:label:` in Lua.
  -- ["@operator"] = { link = "Operator" }, -- For any operator: `+`, but also `->` and `*` in C.
  -- ["@keyword"] = { link = "Keyword" }, -- For keywords that don't fall in previous categories.
  ["@keyword.conditional"]              = { link = "Conditional" },
  ["@keyword.coroutine"]                = { link = "@keyword" },
  ["@keyword.debug"]                    = { link = "Debug" },
  ["@keyword.directive"]                = { link = "PreProc" },
  ["@keyword.directive.define"]         = { link = "Define" },
  ["@keyword.exception"]                = { link = "Exception" },
  ["@keyword.function"]                 = { link = "@keyword" }, -- For keywords used to define a fuction.
  ["@keyword.import"]                   = { link = "Include" },
  ["@keyword.export"]                   = { fg = "orange", bold = true },
  ["@keyword.operator"]                 = { link = "@operator" },
  ["@keyword.repeat"]                   = { link = "Repeat" },
  ["@keyword.return"]                   = { link = "@keyword.export" },

  --- Identifiers
  ["@variable"]                         = { link = "Constant" }, -- Any variable name that does not have another highlight. WARN: broken in 0.10 but not documented?
  ["@variable.builtin"]                 = { fg = "orange" },     -- Variable names that are defined by the languages, like `this` or `self`.
  ["@variable.member"]                  = { fg = "yellow" },     -- For fields.
  ["@variable.parameter"]               = { fg = "cyan" },       -- For parameters of a function. -- FIX:
  -- ["@variable.parameter.builtin"] = {}, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

  ["@type"]                             = { fg = "blue", underline = true, bold = false, italic = true },
  ["@type.builtin"]                     = { fg = "yellow", italic = true },
  ["@type.definition"]                  = { fg = "blue", underline = true, italic = true, bold = false },

  ["@namespace.builtin"]                = { link = "@variable.builtin" },

  ["@module"]                           = { link = "Include" },
  -- ["@module.builtin"] = {}, -- Variable names that are defined by the languages, like `this` or `self`.

  ["@tag"]                              = { fg = "cyan", nocombine = true, italic = false },
  ["@tag.tsx"]                          = { fg = "cyan", nocombine = true, italic = false },
  ["@tag.jsx"]                          = { fg = "cyan", nocombine = true, italic = false },
  ["@tag.delimiter"]                    = { fg = "disabled" },
  ["@tag.builtin"]                      = { fg = "purple", bold = true },
  ["@tag.attribute"]                    = { fg = "orange", italic = true, bold = true },

  --- Misc
  ["@diff.plus"]                        = { link = "diffAdded" },
  ["@diff.minus"]                       = { link = "diffRemoved" },
  ["@diff.delta"]                       = { link = "diffChanged" },

  -- LSP Semantic Token Groups
  -- ["@lsp.type"]                              = { fg = "blue", underline = true, italic = true, bold = false },
  -- ["@lsp.type.type"]                         = { fg = "blue", underline = true, italic = true, bold = false },
  -- ["@lsp.type.boolean"]                      = { link = "@boolean" },
  -- ["@lsp.type.builtinType"]                  = { link = "@type.builtin" },
  -- ["@lsp.type.comment"]                      = { link = "@comment" },
  -- ["@lsp.type.function"]                     = { link = "function.call", nocombine = true },
  -- ["@lsp.type.decorator"]                    = { link = "@attribute" },
  -- ["@lsp.type.deriveHelper"]                 = { link = "@attribute" },
  -- ["@lsp.type.enum"]                         = { link = "@type.definition" },
  -- ["@lsp.type.enumMember"]                   = { link = "@constant" },
  -- ["@lsp.type.escapeSequence"]               = { link = "@string.escape" },
  -- ["@lsp.type.formatSpecifier"]              = { link = "@markup.list" },
  -- ["@lsp.type.generic"]                      = { link = "@variable" },
  -- ["@lsp.type.interface"]                    = { link = "@type.definition" },
  -- ["@lsp.type.keyword"]                      = { link = "@keyword" },
  -- ["@lsp.type.lifetime"]                     = { link = "@keyword.storage" },
  -- ["@lsp.type.namespace"]                    = { link = "@module" },
  -- ["@lsp.type.number"]                       = { link = "@number" },
  -- ["@lsp.type.operator"]                     = { link = "@operator" },
  -- ["@lsp.type.parameter"]                    = { link = "@variable.parameter" },
  -- ["@lsp.type.property"]                     = {},
  -- ["@lsp.type.selfKeyword"]                  = { link = "@variable.builtin" },
  -- ["@lsp.type.selfTypeKeyword"]              = { link = "@variable.builtin" },
  -- ["@lsp.type.string"]                       = { link = "@string" },
  -- ["@lsp.type.typeAlias"]                    = { link = "@type.definition" },
  -- ["@lsp.type.unresolvedReference"]          = { link = "@markup.link" },
  -- ["@lsp.type.variable"]                     = { fg = "fg", underline = false, bold = true },                      -- use treesitter styles for regular variables
  -- ["@lsp.mod.declaration"]                   = { fg = "yellow", underline = true, bold = true, nocombine = true }, -- use treesitter styles for regular variables
  -- ["@lsp.mod.defaultLibrary"]                = { fg = "cyan", underline = false },                                 -- use treesitter styles for regular variables
  -- ["@lsp.typemod.property.declaration"]      = { fg = "cyan", nocombine = true },                                  -- use treesitter styles for regular variables
  -- ["@lsp.typemod.function.declaration"]      = { fg = "yellow", underline = true, bold = true, nocombine = true }, -- use treesitter styles for regular variables
  -- ["@lsp.type.typeParameter"]                = { fg = "lime", italic = true },
  -- ["@lsp.typemod.typeParameter"]             = { link = "@lsp.type.typeParameter" },                               -- use treesitter styles for regular variables
  -- ["@lsp.typemod.parameter.declaration"]     = { fg = "fg", bold = true, underline = false, nocombine = true },    -- use treesitter styles for regular variables
  -- ["@lsp.typemod"]                           = { link = "@type" },
  -- ["@lsp.typemod.function.readonly"]         = { link = "@function" },
  -- ["@lsp.typemod.class.defaultLibrary"]      = { link = "@type.builtin" },
  -- ["@lsp.typemod.enum.defaultLibrary"]       = { link = "@type.builtin" },
  -- ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
  -- ["@lsp.typemod.function.defaultLibrary"]   = { link = "@function.builtin" },
  -- ["@lsp.typemod.keyword.async"]             = { link = "@keyword.coroutine" },
  -- ["@lsp.typemod.keyword.injected"]          = { link = "@keyword" },
  -- ["@lsp.typemod.macro.defaultLibrary"]      = { link = "@function.builtin" },
  -- ["@lsp.typemod.method.defaultLibrary"]     = { link = "@function.builtin" },
  -- ["@lsp.typemod.operator.injected"]         = { link = "@operator" },
  -- ["@lsp.typemod.string.injected"]           = { link = "@string" },
  -- ["@lsp.typemod.struct.defaultLibrary"]     = { link = "@type.builtin" },
  -- ["@lsp.typemod.type.defaultLibrary"]       = { link = "@type.builtin" },
  -- ["@lsp.typemod.typeAlias.defaultLibrary"]  = { link = "@type.builtin" },
  -- ["@lsp.typemod.variable.callable"]         = { link = "@function" },
  -- ["@lsp.typemod.variable.defaultLibrary"]   = { link = "@variable.builtin" },
  -- ["@lsp.typemod.variable.injected"]         = { link = "@variable" },
  -- ["@lsp.typemod.variable.static"]           = { link = "@constant" },
  -- ["@lsp.typemod.variable"]                  = { fg = "fg", underline = false, bold = true, nocombine = true },
  -- ["@lsp.typemod.variable.readonly"]         = { link = "@function" },
  -- ["@lsp.typemod.variable.declaration"]      = { link = "@lsp.typemod.variable" },
  -- ["@lsp.typemod.member"]               = { fg = "yellow", underline = false, bold = false, italic = true },
  -- ["@lsp.typemod.variable.readonly"]         = { fg = "yellow", underline = false, bold = false, italic = true },
  -- ["@lsp.typemod.enumMember"]           = { fg = "fg", underline = false },
  -- ["@lsp.typemod.property"]             = { fg = "fg", underline = false, bold = true, nocombine = true },
  -- ["@lsp.typemod.variable.globalScope"] -- (global variables)

  -- HiPhish/nvim-ts-rainbow2
  TSRainbowRed                          = { fg = "pink" },
  TSRainbowOrange                       = { fg = "orange" },
  TSRainbowYellow                       = { fg = "yellow" },
  TSRainbowGreen                        = { fg = "green" },
  TSRainbowBlue                         = { fg = "blue" },
  TSRainbowViolet                       = { fg = "purple2" },
  TSRainbowCyan                         = { fg = "cyan" },

  -- HiPhish/rainbow-delimiters.nvim
  RainbowDelimiterRed                   = { link = "TSRainbowRed" },
  RainbowDelimiterOrange                = { link = "TSRainbowOrange" },
  RainbowDelimiterYellow                = { link = "TSRainbowYellow" },
  RainbowDelimiterGreen                 = { link = "TSRainbowGreen" },
  RainbowDelimiterBlue                  = { link = "TSRainbowBlue" },
  RainbowDelimiterViolet                = { link = "TSRainbowViolet" },
  RainbowDelimiterCyan                  = { link = "TSRainbowCyan" },

  -- folke/trouble.nvim
  TroubleNormal                         = { link = "NormalSB" },

  -- diff
  diffAdded                             = { fg = "lime" },
  diffRemoved                           = { fg = "red" },
  diffChanged                           = { fg = "yellow" },
  diffOldFile                           = { fg = "yellow" },
  diffNewFile                           = { fg = "red" },
  diffFile                              = { fg = "blue" },
  diffLine                              = { fg = "comments" },
  diffIndexLine                         = { fg = "purple" },

  -- NeogitOrg/neogit
  NeogitBranch                          = { fg = "blue" },
  NeogitRemote                          = { fg = "purple" },
  NeogitHunkHeader                      = { fg = "fg", bg = "highlight" },
  NeogitHunkHeaderHighlight             = { fg = "blue", bg = "contrast" },
  NeogitDiffContextHighlight            = { fg = "text", bg = "contrast" },
  NeogitDiffDeleteHighlight             = { link = "diffRemoved" },
  NeogitDiffAddHighlight                = { link = "diffAdded" },

  -- airblade/vim-gitgutter
  GitGutterAdd                          = { link = "diffAdded" },   -- diff mode: Added line |diff.txt|
  GitGutterChange                       = { link = "diffChanged" }, -- diff mode: Changed line |diff.txt|
  GitGutterDelete                       = { link = "diffRemoved" }, -- diff mode: Deleted line |diff.txt|
  GitGutterAddLineNr                    = { link = "diffAdded" },
  GitGutterChangeLineNr                 = { link = "diffChanged" },
  GitGutterDeleteLineNr                 = { link = "diffRemoved" },

  -- lewis6991/gitsigns.nvim
  GitSignsAdd                           = { link = "diffAdded" },   -- diff mode: Added line |diff.txt|
  GitSignsChange                        = { link = "diffChanged" }, -- diff mode: Changed line |diff.txt|
  GitSignsDelete                        = { link = "diffRemoved" }, -- diff mode: Deleted line |diff.txt|

  -- nvim-telescope/telescope.nvim
  TelescopeNormal                       = { link = "NormalFloat" },
  TelescopeBorder                       = { fg = "border" },
  -- TelescopePreviewBorder                     = { fg = "lime" },
  -- TelescopeSelection                         = { fg = "purple" },
  TelescopeMatching                     = { link = "Search" },

  -- nvim-neo-tree/neo-tree.nvim
  -- TODO: hunt down the "(n hidden items)" highlight group
  NeoTreeNormal                         = { link = "NormalSB" },
  NeoTreeNormalNC                       = { link = "NeoTreeNormal" },
  IndentBlanklineChar                   = { fg = "selection" },

  -- NeoTreeCursorLine = { bold = true },
  NeoTreeIndentMarker                   = { link = "Whitespace" },
  NeoTreeTabActive                      = { fg = "bg", bg = "accent" },
  NeoTreeTabInactive                    = { fg = "fg", bg = "border" },

  NeoTreeDimText                        = { fg = "text" },
  NeoTreeDotfile                        = { fg = "text" },

  NeoTreeGitAdded                       = { link = "diffAdded" },
  NeoTreeGitConflict                    = { fg = "orange", bold = true, italic = true },
  NeoTreeGitDeleted                     = { link = "diffRemoved" },
  NeoTreeGitModified                    = { link = "diffChanged" },
  NeoTreeGitUntracked                   = { fg = "orange", italic = true },

  -- lambdalisue/glyph-palette.vim
  GlyphPalette1                         = { fg = "red" },
  GlyphPalette2                         = { fg = "lime" },
  GlyphPalette3                         = { fg = "yellow" },
  GlyphPalette4                         = { fg = "blue" },
  GlyphPalette6                         = { fg = "cyan" },
  GlyphPalette7                         = { fg = "fg" },
  GlyphPalette9                         = { fg = "orange" },
  GlyphPaletteDirectory                 = { fg = "text" },

  -- nvimdev/dashboard-nvim
  DashboardShortCut                     = { fg = "blue" },
  DashboardHeader                       = { fg = "red" },
  DashboardCenter                       = { fg = "purple3" },
  DashboardFooter                       = { fg = "lime", italic = true },
  -- DashboardKey = {},
  -- DashboardDesc = {},
  -- DashboardIcon = {},

  -- folke/which-key.nvim
  WhichKey                              = { fg = "accent", bold = false },
  WhichKeyGroup                         = { fg = "white", bold = true },
  WhichKeyDesc                          = { fg = "cyan", italic = true },
  WhichKeySeparator                     = { fg = "fg", bold = false },
  WhichKeyFloat                         = { link = "NormalFloat" },
  WhichKeyValue                         = { link = "NormalFloat" },

  -- nvimdev/lspsaga.nvim
  DiagnosticWarning                     = { link = "DiagnosticWarn" },
  DiagnosticInformation                 = { link = "DiagnosticInfo" },

  LspFloatWinNormal                     = { bg = "contrast" },
  LspFloatWinBorder                     = { fg = "purple" },

  LspSagaBorderTitle                    = { fg = "purple3" },
  LspSagaHoverBorder                    = { fg = "blue" },
  LspSagaRenameBorder                   = { fg = "lime" },
  LspSagaDefPreviewBorder               = { fg = "lime" },
  LspSagaCodeActionBorder               = { fg = "blue" },
  LspSagaFinderSelection                = { fg = "lime" },
  LspSagaCodeActionTitle                = { fg = "blue" },
  LspSagaCodeActionContent              = { fg = "purple" },
  LspSagaSignatureHelpBorder            = { fg = "pink" },

  ReferencesCount                       = { fg = "purple" },
  DefinitionCount                       = { fg = "purple" },
  DefinitionIcon                        = { fg = "blue" },
  ReferencesIcon                        = { fg = "blue" },
  TargetWord                            = { fg = "purple3" },

  -- Neovim
  healthError                           = { link = "DiagnosticError" },
  healthSuccess                         = { fg = "lime" },
  healthWarning                         = { link = "DiagnosticWarn" },

  -- akinsho/bufferline.nvim
  BufferLineIndicatorSelected           = { fg = "white", bg = "selection" },
  BufferLineFill                        = { bg = "sidebar" },
  BufferLineTabSelected                 = { fg = "white", bold = true, italic = false, underline = true, bg = "selection", sp = "yellow" },
  BufferLineWarningDiagnosticSelected   = { bg = "selection", fg = "orange", underline = true },
  BufferLineErrorDiagnosticSelected     = { bg = "selection", fg = "orange", underline = true },
  BufferLineSeparator                   = { bg = "sidebar", fg = "sidebar" },
  BufferLineSeparatorVisible            = { bg = "sidebar", fg = "sidebar" },
  BufferLineSeparatorSelected           = { bg = "selection", fg = "sidebar" },
  BufferLineModifiedSelected            = { bg = "selection", fg = "lime" },

  BufferLineBufferSelected              = { link = "BufferLineTabSelected" },
  BufferLineErrorSelected               = { link = "BufferLineTabSelected" },
  BufferLineWarningSelected             = { link = "BufferLineTabSelected" },

  BufferLineBackground                  = { italic = true, fg = "disabled", bg = "sidebar", nocombine = true },
  BufferLineBufferVisible               = { link = "BufferLineBackground" },
  BufferLineErrorVisible                = { link = "BufferLineBackground" },
  BufferLineWarningVisible              = { link = "BufferLineBackground" },
  BufferLineInfoVisible                 = { link = "BufferLineBackground" },
  BufferLineDiagnostic                  = { link = "BufferLineBackground" },
  BufferLineError                       = { link = "BufferLineBackground" },
  BufferLineWarning                     = { link = "BufferLineBackground" },
  BufferLineGroupLabel                  = { link = "BufferLineTabSelected" },
  BufferLineDuplicateSelected           = { bg = "selection", sp = "yellow", underline = true, fg = "text", bold = false, nocombine = true, italic = true },

  -- justinmk/vim-sneak
  Sneak                                 = { fg = "bg", bg = "accent" },
  SneakScope                            = { bg = "selection" },

  -- mfussenegger/nvim-treehopper
  -- TSNodeKey = {},
  -- TSNodeUnmatched = {},

  -- ggandor/leap.nvim
  LeapMatch                             = { fg = "lime", bold = true },
  LeapLabelPrimary                      = { fg = "pink2", bold = true },
  LeapLabelSecondary                    = { fg = "pink", bold = true },
  LeapBackdrop                          = { fg = "text" },

  -- folke/flash.nvim
  FlashBackdrop                         = { fg = "text" },
  FlashLabel                            = { bg = "pink2" },

  -- hrsh7th/nvim-cmp
  -- TODO: cmp
  -- CmpDocumentation = {},
  -- CmpDocumentationBorder = {},
  CmpGhostText                          = { fg = "text" },
  --
  -- CmpItemAbbr = {},
  -- CmpItemAbbrDeprecated = {},
  -- CmpItemAbbrMatch = {},
  -- CmpItemAbbrMatchFuzzy = {},
  --
  -- CmpItemMenu = {},

  CmpItemKindCopilot                    = { fg = "text" },

  -- stevearc/aerial.nvim
  AerialNormal                          = { link = "NormalSB" },
  -- AerialGuide = {},
  AerialLine                            = { link = "LspInlayHint" },

  -- lukas-reineke/indent-blankline.nvim
  IblIndent                             = { link = "Whitespace" },
  IblWhitespace                         = { link = "Whitespace" },
  IblScope                              = { fg = "highlight" },

  -- gbprod/yanky.nvim
  YankyPut                              = { link = "IncSearch" },
  YankyYanked                           = { link = "IncSearch" },

  -- folke/lazy.nvim
  LazyButton                            = { bold = true },
  LazyButtonActive                      = { fg = "white", bg = "selection", bold = true },
  LazyDimmed                            = { fg = "text" },
  LazyDir                               = { fg = "blue" },
  LazyH1                                = { fg = "white", bg = "highlight", bold = true },
  LazyProgressDone                      = { fg = "lime" },
  LazyProp                              = { fg = "cyan" },
  LazySpecial                           = { fg = "purple" },
  LazyUrl                               = { link = "@markup.link.url" },

  --- Border
  NotifyERRORBorder                     = { link = "NotifyERRORIcon" },
  NotifyWARNBorder                      = { link = "NotifyWARNIcon" },
  NotifyINFOBorder                      = { link = "NotifyINFOIcon" },
  NotifyDEBUGBorder                     = { link = "NotifyDEBUGIcon" },
  NotifyTRACEBorder                     = { link = "NotifyTRACEIcon" },
  --- Icons
  NotifyERRORIcon                       = { link = "DiagnosticError" },
  NotifyWARNIcon                        = { link = "DiagnosticWarn" },
  NotifyINFOIcon                        = { link = "DiagnosticInfo" },
  NotifyDEBUGIcon                       = { link = "DiagnosticHint" },
  NotifyTRACEIcon                       = { fg = "border" },
  --- Title
  NotifyERRORTitle                      = { link = "NotifyERRORIcon" },
  NotifyWARNTitle                       = { link = "NotifyWARNIcon" },
  NotifyINFOTitle                       = { link = "NotifyINFOIcon" },
  NotifyDEBUGTitle                      = { link = "NotifyDEBUGIcon" },
  NotifyTRACETitle                      = { link = "NotifyTRACEIcon" },

  -- nvim-lualine/lualine.nvim (custom)
  LualineNormalA                        = { fg = "bg", bg = "purple", bold = true },
  LualineNormalB                        = { fg = "fg", bg = "highlight" },
  LualineNormalC                        = { fg = "fg", bg = "sidebar" },

  LualineInsertA                        = { fg = "bg", bg = "lime", bold = true },
  LualineInsertB                        = { link = "LualineNormalB" },

  LualineVisualA                        = { fg = "bg", bg = "cyan", bold = true },
  LualineVisualB                        = { link = "LualineNormalB" },

  LualineReplaceA                       = { fg = "bg", bg = "red", bold = true },
  LualineReplaceB                       = { link = "LualineNormalB" },

  LualineCommandA                       = { fg = "bg", bg = "yellow", bold = true },
  LualineCommandB                       = { link = "LualineNormalB" },

  LualineInactiveA                      = { fg = "disabled", bg = "bg", bold = true },
  LualineInactiveB                      = { fg = "disabled", bg = "bg" },
  LualineInactiveC                      = { fg = "disabled", bg = "bg" },

  --- Markup
  ["@markup"]                           = { link = "@none" },
  ["@markup.environment"]               = { fg = "purple2", bold = true }, -- only used by latex & xml?
  ["@markup.environment.name"]          = { link = "Type" },
  ["@markup.heading"]                   = { link = "@markup.heading.1" },
  ["@markup.heading.gitcommit"]         = { link = "Title" },
  ["@markup.math"]                      = { link = "Identifier" },
  ["@markup.strong"]                    = { bold = true },
  ["@markup.italic"]                    = { italic = true },
  ["@markup.strikethrough"]             = { strikethrough = true },
  ["@markup.underline"]                 = { underline = true },
  ["@markup.link"]                      = { fg = "link" },
  ["@markup.link.url"]                  = { link = "@string.special.url" },
  ["@markup.link.label"]                = { link = "Identifier" },
  ["@markup.link.label.symbol"]         = { link = "SpecialChar" },
  ["@markup.link.markdown_inline"]      = { link = "Delimiter" },
  ["@markup.raw"]                       = { fg = "cyan" },
  ["@markup.raw.delimiter"]             = { link = "Delimiter" },
  ["@markup.raw.markdown"]              = { link = "@markup.raw" },
  ["@markup.raw.markdown_inline"]       = { link = "@markup.raw" },
  ["@markup.list"]                      = { link = "Label" },     -- For special punctuation that does not fall in the catagories before.
  -- ["@markup.list.markdown"] = {},
  ["@markup.list.unchecked"]            = { link = "Delimiter" }, -- For brackets and parens.
  ["@markup.list.checked"]              = { link = "Delimiter" }, -- For brackets and parens.

  -- HTML regex parser
  htmlLink                              = { link = "@markup.link.url.html" },
  -- Markdown regex parser
  markdownListMarker                    = { link = "@markup.list.markdown" },
  markdownLinkText                      = { link = "@markup.link.label.markdown" },
  markdownLinkTextDelimiter             = { link = "@punctuation.delimiter.markdown" },
  markdownLink                          = { link = "@markup.link.markdown_inline" },
  markdownLinkDelimiter                 = { link = "@punctuation.delimiter.markdown" },
  markdownUrl                           = { link = "@markup.link.url.markdown" },
  markdownCodeBlock                     = { link = "@markup.raw.markdown" },
  markdownEscape                        = { link = "@string.escape.markdown" },

  -- Asciidoc regex parser
  asciidocOneLineTitle                  = { link = "@markup.heading.asciidoc" },
  asciidocBlockTite                     = { link = "asciidocOneLineTitle" },
  asciidocTwoLineTitle                  = { link = "asciidocOneLineTitle" },
  asciidocBackslash                     = { link = "@string.escape.asciidoc" },
  asciidocEntityRef                     = { link = "asciidocBackslash" },
  asciidocLineBreak                     = { link = "@punctuation.special.asciidoc" },
  asciidocPagebreak                     = { link = "asciidocLineBreak" },
  asciidocRuler                         = { link = "asciidocPagebreak" },
  asciidocLiteralBlock                  = { link = "@markup.raw.asciidoc" },
  asciidocLiteralParagraph              = { link = "asciidocLiteralBlock" },
  asciidocListingBlock                  = { link = "asciidocLiteralBlock" },
  asciidocPassthroughBlock              = { link = "@markup.raw.asciidoc" },
  asciidocDoubleDollarPassthrough       = { link = "asciidocPassthroughBlock" },
  asciidocTriplePlusPassthrough         = { link = "asciidocPassthroughBlock" },
  asciidocOpenBlockDelimiter            = { link = "@punctuation.delimiter.asciidoc" },
  asciidocQuoteBlockDelimiter           = { link = "@punctuation.delimiter.asciidoc" },
  asciidocExampleBlockDelimiter         = { link = "@punctuation.delimiter.asciidoc" },
  asciidocSidebarDelimiter              = { link = "@punctuation.delimiter.asciidoc" },
  asciidocTableDelimiter                = { link = "@punctuation.special.asciidoc" },
  asciidocTableDelimiter2               = { link = "asciidocTableDelimiter" },
  asciidocTablePrefix                   = { link = "asciidocTableDelimiter" },
  asciidocTablePrefix2                  = { link = "asciidocTableDelimiter" },
  asciidocListBullet                    = { link = "@markup.list.asciidoc" },
  asciidocListContinuation              = { link = "asciidocListBullet" },
  asciidocListLabel                     = { link = "asciidocListBullet" },
  asciidocListNumber                    = { link = "asciidocListBullet" },
  asciidocAdmonition                    = { link = "Todo" },
  asciidocCallout                       = { link = "asciidocListBullet" },
  asciidocQuotedBold                    = { link = "@markup.strong.asciidoc" },
  asciidocQuotedUnconstrainedBold       = { link = "asciidocQuotedBold" },
  asciidocQuotedEmphasized              = { link = "@markup.italic.asciidoc" },
  asciidocQuotedEmphasized2             = { link = "asciidocQuotedEmphasized" },
  asciidocQuotedEmphasizedItalic        = { link = "asciidocQuotedEmphasized" },
  asciidocQuotedUnconstrainedEmphasized = { link = "asciidocQuotedEmphasized" },
  asciidocQuotedMonospaced              = { link = "@markup.raw.asciidoc" },
  asciidocQuotedMonospaced2             = { link = "asciidocQuotedMonospaced" },
  asciidocQuotedUnconstrainedMonospaced = { link = "asciidocQuotedMonospaced" },
  asciidocAttributeEntry                = { link = "@constant.builtin.asciidoc" },
  asciidocAttributeRef                  = { link = "@constant.asciidoc" },
  asciidocAttributeList                 = { link = "@variable.builtin.asciidoc" },
  asciidocQuotedAttributeList           = { link = "asciidocAttributeList" },
  asciidocURL                           = { link = "@markup.link.url.asciidoc" },
  asciidocEmail                         = { link = "asciidocURL" },
  asciidocRefMacro                      = { link = "asciidocURL" },
  asciidocMacro                         = { link = "@markup.link.asciidoc" },
  asciidocMacroAttributes               = { link = "@markup.link.label.asciidoc" },
  asciidocAnchorMacro                   = { link = "Title" }, -- link source, not destination
  asciidocFilterBlock                   = { link = "@none" },
  asciidocToDo                          = { link = "@none" },
  asciidocHLabel                        = { link = "@none" },
  asciidocTable_OLD                     = { link = "@none" },
  asciidocIdMarker                      = { link = "@none" },
  -- helpCommand = {},

  -- debugPC = {}, -- used for highlighting the current line in terminal-debug
  -- debugBreakpoint = {}, -- used for breakpoint colors in terminal-debug
  dosIniLabel                           = { link = "@property" },

}

-- lsp symbol kind and completion kind highlights
local kinds = {
  Array = "@punctuation.bracket",
  Boolean = "@boolean",
  Class = "@type",
  Color = "Special",
  Constant = "@constant",
  Constructor = "@constructor",
  Enum = "@lsp.type.enum",
  EnumMember = "@lsp.type.enumMember",
  Event = "Special",
  Field = "@variable.member",
  File = "Normal",
  Folder = "Directory",
  Function = "@function",
  Interface = "@lsp.type.interface",
  Key = "@variable.member",
  Keyword = "@lsp.type.keyword",
  Method = "@function.method",
  Module = "@module",
  Namespace = "@module",
  Null = "@constant.builtin",
  Number = "@number",
  Object = "@constant",
  Operator = "@operator",
  Package = "@module",
  Property = "@property",
  Reference = "@markup.link",
  Snippet = "Conceal", -- FIX: too dark?
  String = "@string",
  Struct = "@lsp.type.struct",
  Unit = "@lsp.type.struct",
  Text = "@markup",
  TypeParameter = "@lsp.type.typeParameter",
  Variable = "@variable",
  Value = "@string",
}
local kind_groups = {
  "NavicIcons%s",
  "Aerial%sIcon",
  "CmpItemKind%s",
  "NoiceCompletionItemKind%s"
}
for kind, link in pairs(kinds) do
  local base = "LspKind" .. kind
  M[base] = { link = link }
  for _, plugin in pairs(kind_groups) do
    M[plugin:format(kind)] = { link = base }
  end
end

-- Rainbow headers
---@type string[]
local h_rainbow = { "purple", "orange", "pink", "lime", "cyan", "yellow" }
for i, c in ipairs(h_rainbow) do
  M["@markup.heading." .. i] = { fg = c, bold = true }
  M["@markup.heading." .. i .. ".marker"] = { fg = c }

  M["htmlH" .. i] = { link = "@markup.heading." .. i }
  M["markdownH" .. i .. "Delimiter"] = { link = "@markup.heading." .. i .. ".marker" }
end

-- Diagnostic group links
if not vim.diagnostic then
  local severity_map = {
    Error = "Error",
    Warn = "Warning",
    Info = "Information",
    Hint = "Hint",
  }
  local types = { "Default", "VirtualText", "Underline" }

  for _, type in ipairs(types) do
    for snew, sold in pairs(severity_map) do
      M["LspDiagnostics" .. type .. sold] = {
        link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
      }
    end
  end
end

-- Apply user-defined config
if config.transparent.background then
  M.Normal.bg = "NONE"
  -- M.CursorLine = { bold = true, italic = true } -- if CursorLine is solid bg
end
if config.transparent.float then
  M.NormalFloat.bg = "NONE"
  M.FloatBorder.bg = "NONE"
end
if config.transparent.popup then
  M.Pmenu.bg = "NONE"
  M.PmenuSel = { bold = true, italic = true }
  -- M.PmenuSel = { fg = "highlight", italic = true }
end
if config.transparent.sidebar then
  M.NormalSB.bg = "NONE"
end

return M
