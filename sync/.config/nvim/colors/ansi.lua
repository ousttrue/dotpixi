-- https://www.reddit.com/r/neovim/comments/t3nm8j/lua_vimhighlightclear/
local function hl_clear()
  vim.cmd("hi clear")

  -- clear ts specific
  local defs = vim.api.nvim_get_hl(0, { link = true, create = true });
  for hl_name, v in pairs(defs) do
    -- if string.match(hl_name, "^@%a+%.[%a%.]+$") then
    --   -- print('clear', hl_name)
    --   vim.api.nvim_set_hl(0, hl_name, {})
    -- end
    if string.match(hl_name, "^@") then
      -- print('clear', hl_name)
      vim.api.nvim_set_hl(0, hl_name, {})
    end
  end
end

-- https://hamvocke.com/blog/ansi-vim-color-scheme/
local function define()
  vim.opt.termguicolors = false
  local colors_name = 'ansi'
  vim.g.colors_name = colors_name
  vim.cmd("colorscheme " .. colors_name)

  hl_clear()

  -- This color scheme relies on ANSI colors only. It automatically inherits
  -- the 16 colors of your terminal color scheme. You can change the colors of
  -- certain highlight groups by picking a different color from the following set
  -- of colors. If you sticked to the ANSI color palette conventions when setting
  -- colors in your terminal emulator, this will look pretty neat. If you used
  -- a terminal color scheme that uses a different convention (e.g. base16)
  -- colors will likely look very odd if you use this color scheme.
  --
  -- 0: Black        │   8: Bright Black (dark gray)
  -- 1: Red          │   9: Bright Red
  -- 2: Green        │  10: Bright Green
  -- 3: Yellow       │  11: Bright Yellow
  -- 4: Blue         │  12: Bright Blue
  -- 5: Magenta      │  13: Bright Magenta
  -- 6: Cyan         │  14: Bright Cyan
  -- 7: White (gray) │  15: Bright White
  --
  -- Use the 'cterm' argument to make certain highlight groups appear in italic
  -- (if your terminal and font support it), bold, reverse, underlined, etc.
  -- See ':help attr-list' for possible options.

  -- Editor Elements
  vim.api.nvim_set_hl(0, "NonText", { ctermfg = 0 })
  vim.api.nvim_set_hl(0, "Ignore", {})
  vim.api.nvim_set_hl(0, "Underlined", { underline = true })
  vim.api.nvim_set_hl(0, "Bold", { bold = true })
  vim.api.nvim_set_hl(0, "Italic", { italic = true })
  vim.api.nvim_set_hl(0, "StatusLine", { ctermfg = 15, ctermbg = 8 })
  vim.api.nvim_set_hl(0, "StatusLineNC", { ctermfg = 15, ctermbg = 0 })
  vim.api.nvim_set_hl(0, "VertSplit", { ctermfg = 8 })
  vim.api.nvim_set_hl(0, "TabLine", { ctermfg = 7, ctermbg = 0 })
  vim.api.nvim_set_hl(0, "TabLineFill", { ctermfg = 0 })
  vim.api.nvim_set_hl(0, "TabLineSel", { ctermfg = 0, ctermbg = 4 })
  vim.api.nvim_set_hl(0, "BufferCurrentMod", { ctermfg = 0, ctermbg = 4, underline = true })
  vim.api.nvim_set_hl(0, "Title", { ctermfg = 4, bold = true })
  vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = 0 })
  vim.api.nvim_set_hl(0, "Cursor", { ctermbg = 15, ctermfg = 0 })
  vim.api.nvim_set_hl(0, "CursorColumn", { ctermbg = 0 })
  vim.api.nvim_set_hl(0, "LineNr", { ctermfg = 8 })
  vim.api.nvim_set_hl(0, "CursorLineNr", { ctermfg = 6 })
  vim.api.nvim_set_hl(0, "helpLeadBlank", {})
  vim.api.nvim_set_hl(0, "helpNormal", {})
  vim.api.nvim_set_hl(0, "Visual", { ctermbg = 8, ctermfg = 15, bold = true })
  vim.api.nvim_set_hl(0, "VisualNOS", { ctermbg = 8, ctermfg = 15, bold = true })
  vim.api.nvim_set_hl(0, "Pmenu", { ctermbg = 0, ctermfg = 15 })
  vim.api.nvim_set_hl(0, "PmenuSbar", { ctermbg = 8, ctermfg = 7 })
  vim.api.nvim_set_hl(0, "PmenuSel", { ctermbg = 8, ctermfg = 15, bold = true })
  vim.api.nvim_set_hl(0, "PmenuThumb", { ctermbg = 7, })
  vim.api.nvim_set_hl(0, "FoldColumn", { ctermfg = 7 })
  vim.api.nvim_set_hl(0, "Folded", { ctermfg = 12 })
  vim.api.nvim_set_hl(0, "WildMenu", { ctermbg = 0, ctermfg = 15, })
  vim.api.nvim_set_hl(0, "SpacialKey", { ctermfg = 0 })
  vim.api.nvim_set_hl(0, "IncSearch", { ctermbg = 1, ctermfg = 0 })
  vim.api.nvim_set_hl(0, "CurSearch", { ctermbg = 3, ctermfg = 0 })
  vim.api.nvim_set_hl(0, "Search", { ctermbg = 13, ctermfg = 0 })
  vim.api.nvim_set_hl(0, "Directory", { ctermfg = 4 })
  vim.api.nvim_set_hl(0, "MatchParen", { ctermbg = 0, ctermfg = 3, underline = true })
  vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true })
  vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true })
  vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true })
  vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true })
  vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 8 })
  vim.api.nvim_set_hl(0, "SignColumn", { ctermfg = 7 })
  vim.api.nvim_set_hl(0, "ModeMsg", { ctermbg = 15, ctermfg = 0, bold = true })
  vim.api.nvim_set_hl(0, "MoreMsg", { ctermfg = 4 })
  vim.api.nvim_set_hl(0, "Question", { ctermfg = 4 })
  vim.api.nvim_set_hl(0, "QuickFixLine", { ctermbg = 0, ctermfg = 14 })
  vim.api.nvim_set_hl(0, "Conceal", { link = "NonText" })
  vim.api.nvim_set_hl(0, "@conceal", { link = "Conceal" })
  vim.api.nvim_set_hl(0, "@markup.link.url.markdown_inline", { link = "Conceal" })
  vim.api.nvim_set_hl(0, "ToolbarLine", { ctermbg = 0, ctermfg = 15 })
  vim.api.nvim_set_hl(0, "ToolbarButton", { ctermbg = 8, ctermfg = 15 })
  vim.api.nvim_set_hl(0, "debugPC", { ctermfg = 7 })
  vim.api.nvim_set_hl(0, "debugBreakpoint", { ctermfg = 8 })
  vim.api.nvim_set_hl(0, "ErrorMsg", { ctermfg = 1, bold = true, italic = true })
  vim.api.nvim_set_hl(0, "WarningMsg", { ctermfg = 11 })
  vim.api.nvim_set_hl(0, "DiffAdd", { ctermbg = 10, ctermfg = 0 })
  vim.api.nvim_set_hl(0, "DiffChange", { ctermbg = 12, ctermfg = 0 })
  vim.api.nvim_set_hl(0, "DiffDelete", { ctermbg = 9, ctermfg = 0 })
  vim.api.nvim_set_hl(0, "DiffText", { ctermbg = 14, ctermfg = 0 })
  vim.api.nvim_set_hl(0, "diffAdded", { ctermfg = 10 })
  vim.api.nvim_set_hl(0, "diffRemoved", { ctermfg = 9 })
  vim.api.nvim_set_hl(0, "diffChanged", { ctermfg = 12 })
  vim.api.nvim_set_hl(0, "diffOldFile", { ctermfg = 11 })
  vim.api.nvim_set_hl(0, "diffNewFile", { ctermfg = 13 })
  vim.api.nvim_set_hl(0, "diffFile", { ctermfg = 12 })
  vim.api.nvim_set_hl(0, "diffLine", { ctermfg = 7 })
  vim.api.nvim_set_hl(0, "diffIndexLine", { ctermfg = 14 })
  vim.api.nvim_set_hl(0, "healthError", { ctermfg = 1 })
  vim.api.nvim_set_hl(0, "healthSuccess", { ctermfg = 2 })
  vim.api.nvim_set_hl(0, "healthWarning", { ctermfg = 3 })

  --
  -- Syntax
  --
  vim.api.nvim_set_hl(0, "Hlargs", { ctermfg = 1, bold = true })
  vim.api.nvim_set_hl(0, "@text.strong", { ctermfg = 0, ctermbg = 2 })

  -- comment
  vim.api.nvim_set_hl(0, "Comment", { ctermfg = 8, italic = true, })
  vim.api.nvim_set_hl(0, "SpecialComment", { link = "Comment" })
  vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })

  -- keyword
  vim.api.nvim_set_hl(0, "Keyword", { ctermfg = 4 })
  vim.api.nvim_set_hl(0, "@keyword", { link = "Keyword" })
  vim.api.nvim_set_hl(0, "Operator", { link = "Keyword" })
  vim.api.nvim_set_hl(0, "Delimiter", { link = "Keyword" })
  vim.api.nvim_set_hl(0, "@punctuation", { link = "Keyword" })
  vim.api.nvim_set_hl(0, "@operator", { link = "Keyword" })
  vim.api.nvim_set_hl(0, "@keyword.type", { link = "Keyword" })
  -- const etc
  vim.api.nvim_set_hl(0, "@keyword.modifier.cpp", { link = "Keyword" })
  vim.api.nvim_set_hl(0, "@constant", { link = "Keyword" })
  -- this

  -- const / compile time
  vim.api.nvim_set_hl(0, "Constant", { ctermfg = 3 })
  vim.api.nvim_set_hl(0, "Type", { link = "Constant" })
  vim.api.nvim_set_hl(0, "Define", { link = "Constant" })
  vim.api.nvim_set_hl(0, "Structure", { link = "Constant" })
  vim.api.nvim_set_hl(0, "@type", { link = "Constant" })
  vim.api.nvim_set_hl(0, "@type.builtin", { link = "Constant" })
  vim.api.nvim_set_hl(0, "@module", { link = "Constant" })
  vim.api.nvim_set_hl(0, "Function", { link = "Constant" })
  vim.api.nvim_set_hl(0, "@function", { link = "Function" })

  -- literal
  vim.api.nvim_set_hl(0, "String", { ctermfg = 7 })
  vim.api.nvim_set_hl(0, "@string", { link = "String" })
  vim.api.nvim_set_hl(0, "@boolean", { link = "String" })
  vim.api.nvim_set_hl(0, "@markup.link", { link = "String" })
  vim.api.nvim_set_hl(0, "@number", { link = "String" })

  -- id
  vim.api.nvim_set_hl(0, "Identifier", { ctermfg = 2 })
  vim.api.nvim_set_hl(0, "@markup.heading", { link = "Identifier" })
  vim.api.nvim_set_hl(0, "@variable", { link = "Identifier" })
  vim.api.nvim_set_hl(0, "@variable.builtin", { link = "Keyword" })
  vim.api.nvim_set_hl(0, "@property", { link = "Identifier" })
  -- vim.api.nvim_set_hl(0, "@function.call", { link = "Constant" })

  vim.api.nvim_set_hl(0, "Error", { ctermfg = 1 })
  vim.api.nvim_set_hl(0, "Boolean", { ctermfg = 3 })
  vim.api.nvim_set_hl(0, "Label", { ctermfg = 14 })
  vim.api.nvim_set_hl(0, "Exception", { ctermfg = 5 })
  vim.api.nvim_set_hl(0, "Conditional", { ctermfg = 5 })
  vim.api.nvim_set_hl(0, "Statement", { ctermfg = 5 })
  vim.api.nvim_set_hl(0, "StorageClass", { ctermfg = 11 })
  vim.api.nvim_set_hl(0, "Todo", { ctermfg = 0, ctermbg = 9, bold = true })

  -- statement
  vim.api.nvim_set_hl(0, "Special", { link = "Statement" })
  vim.api.nvim_set_hl(0, "PreProc", { link = "Statement" })
  vim.api.nvim_set_hl(0, "Include", { link = "Statement" })
  vim.api.nvim_set_hl(0, "Macro", { link = "Statement" })
  vim.api.nvim_set_hl(0, "@markup.heading", { link = "Statement" })

  -- neovim-specific (remove if you're using vim)
  vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg = 0, ctermfg = 15 })
  vim.api.nvim_set_hl(0, "FloatBorder", { ctermbg = 0, ctermfg = 7 })
  vim.api.nvim_set_hl(0, "FloatShadow", { ctermbg = 0, ctermfg = 15 })
end
define()

vim.api.nvim_create_user_command("RedefAnsi", function()
  define()
  vim.cmd("colorscheme ansi")
end, {})
