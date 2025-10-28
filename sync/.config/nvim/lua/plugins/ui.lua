-- tabline: use barbar
-- winbar
-- status: laststatus = 2

-- https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua
local function evel_lualine()
  -- Eviline config for lualine
  -- Author: shadmansaleh
  -- Credit: glepnir
  local lualine = require('lualine')

  -- Color table for highlights
  -- stylua: ignore
  local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
  }

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand('%:p:h')
      local gitdir = vim.fn.finddir('.git', filepath .. ';')
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }

  -- Config
  local config = {
    options = {
      -- Disable sections and component separators
      component_separators = '',
      section_separators = '',
      theme = {
        -- We are going to use lualine_c an lualine_x as left and
        -- right section. Both are highlighted by c theme .  So we
        -- are just setting default looks o statusline
        normal = { c = { fg = colors.fg, bg = colors.bg } },
        inactive = { c = { fg = colors.fg, bg = colors.bg } },
      },
    },
    sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      -- These will be filled later
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
    winbar = {
      lualine_c = {
        {
          'filename',
          path = 2,
        }
      }
    },
  }

  -- Inserts a component in lualine_c at left section
  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  -- Inserts a component in lualine_x at right section
  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  ins_left {
    function()
      return '▊'
    end,
    color = { fg = colors.blue },      -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
  }

  ins_left {
    -- mode component
    function()
      return ''
    end,
    color = function()
      -- auto change color according to neovims mode
      local mode_color = {
        n = colors.red,
        i = colors.green,
        v = colors.blue,
        [''] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.red,
      }
      return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
  }

  ins_left {
    -- filesize component
    'filesize',
    cond = conditions.buffer_not_empty,
  }

  ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = 'bold' },
  }

  ins_left { 'location' }

  ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

  ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
      error = { fg = colors.red },
      warn = { fg = colors.yellow },
      info = { fg = colors.cyan },
    },
  }

  -- Insert mid section. You can make any number of sections in neovim :)
  -- for lualine it's any number greater then 2
  ins_left {
    function()
      return '%='
    end,
  }

  ins_left {
    -- Lsp server name .
    function()
      local msg = 'No Active Lsp'
      local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
      local clients = vim.lsp.get_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end,
    icon = ' LSP:',
    color = { fg = '#ffffff', gui = 'bold' },
  }

  -- Add components to right sections
  ins_right {
    'o:encoding',       -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = 'bold' },
  }

  ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.green, gui = 'bold' },
  }

  ins_right {
    'branch',
    icon = '',
    color = { fg = colors.violet, gui = 'bold' },
  }

  ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.orange },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
  }

  ins_right {
    function()
      return '▊'
    end,
    color = { fg = colors.blue },
    padding = { left = 1 },
  }

  -- Now don't forget to initialize lualine
  lualine.setup(config)
end

-- https://qiita.com/nab/items/dd00f45d9d932592ea7a
local function setup_lualine()
  -- 色コードをまとめて設定。各プラグインの色設定で使用
  local colors = {
    fg = '#ffffff',
    fg2 = '#353535',
    fg3 = '#a8a8a8',
    bg = '#525252',
    bg3 = '#353535',
    white = '#ffffff',
    black = '#000000',
    yellow = '#ffec50',
    orange = '#ffaf00',
    red = '#ff6510',
    magenta = '#e0898d',
    cyan = '#7bbfff',
    blue = '#235bc8',
    darkblue = '#3672a4',
    green = '#78ff94',
    darkbrown = '#542d24',
  }

  -- 独自テーマの設定
  local custom_theme = {
    normal = {
      a = { fg = colors.fg2, bg = colors.cyan, gui = 'bold' },
      b = { fg = colors.fg, bg = colors.darkblue },
      c = { fg = colors.fg, bg = colors.bg },
    },
    insert = { a = { fg = colors.fg2, bg = colors.yellow, gui = 'bold' } },
    visual = { a = { fg = colors.fg2, bg = colors.magenta, gui = 'bold' } },
    replace = { a = { fg = colors.fg2, bg = colors.green, gui = 'bold' } },
    command = { a = { fg = colors.fg2, bg = colors.red, gui = 'bold' } },
    terminal = { a = { fg = colors.fg2, bg = colors.orange, gui = 'bold' } },
    inactive = {
      a = { fg = colors.fg, bg = colors.bg3, gui = 'bold' },
      b = { fg = colors.fg3, bg = colors.bg3 },
      c = { fg = colors.fg3, bg = colors.bg3 },
    },
  }

  -- fileformatをタイプ別に色分け
  local function fileformat_color()
    local format = vim.bo.fileformat
    if format == 'unix' then
      return { fg = colors.red }
    elseif format == 'dos' then
      return { fg = colors.cyan }
    elseif format == 'mac' then
      return { fg = colors.green }
    end
  end

  -- modeの表示文字列を変更
  local function custom_mode()
    local mode_map = {
      n = 'N',      -- Normal モード
      i = 'INS',    -- Insert モード
      v = 'VIS',    -- Visual モード
      V = 'V-L',    -- Visual-Line モード
      [''] = 'V-B', -- Visual-Block モード
      c = 'CMD',    -- Command モード
      R = 'REP',    -- Replace モード
      t = 'TERM',   -- Terminal モード
    }
    local current_mode = vim.fn.mode()
    return mode_map[current_mode] or current_mode
  end

  -- 猫ちゃん連れてく
  local function mycat()
    -- 候補：
    -- 󰄛 ,󰆚 ,󰩃 ,󰇥 ,󱖿 ,󱗂 ,󰈺 ,󰊠 ,󱕘 ,󱜿 ,󰏩 ,󰻀 ,󰐁 ,󰤇 ,󰚩 ,󱌧 ,󰚌 ,󱙷 ,󰴻 ,󱅼 , ,
    -- 󰉊 ,󰣠 ,󰋑 ,󱁏 ,󰮣 ,󰟟 ,󰫕 ,󰜃 ,󰮿 ,󰟪 ,󰑣 ,󰚬 ,󱕬 ,󰴺 ,󰓿 ,󰔬 ,󰯙 ,󱂖 ,󰕊 , , ,
    return '󰄛'
  end

  local win_width = vim.api.nvim_win_get_width(0) -- ウィンドウ幅

  require('lualine').setup {
    options = {
      theme = custom_theme,
      -- component_separators = { left = '', right = '' },
      -- component_separators = { left = '|', right = '|' },
      component_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },
      section_separators = win_width > 80 and {
        left = '',
        right = '',
      } or {
        left = '',
        right = '',
      },
      globalstatus = false, -- ウィンドウごとに異なるステータスライン
    },
    sections = {
      lualine_a = {
        {
          mycat,
          padding = { left = 1, right = 0 },
          color = { fg = colors.darkbrown },
          cond = function()
            return win_width > 80
          end,
        },
        {
          custom_mode, -- モードをカスタム表示。'mode'の置き換え
        },
      },
      lualine_b = {
        {
          'branch',
          icon = '',
          padding = { left = 0, right = 1 },
          fmt = function(branch_name)
            if not branch_name or branch_name == '' then
              return '' -- Git管理外の場合は空文字列を返す
            end

            if win_width > 100 then
              return ' ' .. branch_name -- アイコン＋テキスト
            else
              return '' -- アイコンのみ
            end
          end,
        },
        {
          'diff',
          symbols = { added = ' ', modified = ' ', removed = ' ' },
          -- symbols = { added = '➕ ', modified = '✏️ ', removed = '❌ ' }
          padding = { left = 0, right = 1 },
          fmt = function(str)
            if win_width > 90 then
              return str
            else
              return str:gsub('%d+', '') -- 数字を削除してアイコンのみを返す
            end
          end,
        },
      },
      lualine_c = {
        {
          'filename',
          path = 0, -- 1:ファイルパスを表示、0:非表示
          -- symbols = { modified = '● ', readonly = '[RO]' },
          symbols = { modified = '●', readonly = '' },
          -- symbols = { modified = ' ', readonly = ' ' },
          -- symbols = { modified = '[+]', readonly = '[-]' },
        },
        {
          'diagnostics',
          update_in_insert = false, -- 挿入モードでは更新しない
          padding = { left = 0, right = 1 },
          symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
          diagnostics_color = {
            error = { fg = colors.red },
            warn = { fg = colors.yellow },
            info = { fg = colors.green },
            hint = { fg = colors.cyan },
          },
          fmt = function(str)
            if win_width > 80 then
              return str
            else
              return str:gsub('%d+', '') -- 数字を削除してアイコンのみを返す
            end
          end,
        },
      },
      lualine_x = {
        {
          'filetype',
          icon_only = win_width <= 90,
        },
        {
          'fileformat',
          symbols = { unix = '', dos = '', mac = '' }, --  , ,
          color = fileformat_color,
          padding = { left = 0, right = 1 },
        },
        {
          'encoding',
          padding = { left = 0, right = 1 },
          cond = function()
            return win_width > 70
          end,
        },
      },
      lualine_y = {
        {
          'progress',
          cond = function()
            return win_width > 80
          end,
        },
      },
      lualine_z = {
        {
          'location',
          padding = 1,
          cond = function()
            return win_width > 70
          end,
        },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  }
end

-- https://qiita.com/uhooi/items/99aeff822d4870a8e269
local lsp_names = function()
  local clients = {}
  for _, client in ipairs(vim.lsp.get_clients { bufnr = 0 }) do
    if client.name == "null-ls" then
      local sources = {}
      for _, source in ipairs(require("null-ls.sources").get_available(vim.bo.filetype)) do
        table.insert(sources, source.name)
      end
      table.insert(clients, "null-ls(" .. table.concat(sources, ", ") .. ")")
    else
      table.insert(clients, client.name)
    end
  end
  return " " .. table.concat(clients, ", ")
end

-- https://qiita.com/Liquid-system/items/b95e8aec02c6b0de4235
local function lsp_name()
  local msg = "No Active"
  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and client.name ~= "null-ls" then
      return client.name
    end
  end
  return msg
end

local skk_mode_map = {
  hira = "あ",
  kata = "ア",
  ascii = "aA",
  zenkaku = "全",
  hankata = "ｧｱ",
  abbrev = "aあ",
}
local function mode_name()
  local mode = skk_mode_map[vim.api.nvim_get_var "skkeleton#mode"]
  local name = skk_mode_map[mode]
  if name then
    return name
  end
  return mode
end

local function skk_mode()
  local m = mode_name()
  if m then
    return m
  else
    return ""
  end
end

local function makeprg()
  if #vim.bo.makeprg > 0 then
    return 'vim.bo:' .. vim.bo.makeprg
  end
  if #vim.o.makeprg > 0 then
    return 'vim.o:' .. vim.o.makeprg
  end
  return 'no makeprg'
end

function my_setup()
  -- local function qf()
  --   if vim.api.nvim_buf_get_option(0, "filetype") == "qf" then
  --     local l = vim.fn.getqflist()
  --     if #l > 0 then
  --       return "quickfix: " .. #l
  --     end
  --   end
  -- end

  ---@diagnostic disable-next-line
  require("lualine").setup {
    options = {
      globalstatus = true,
      disabled_filetypes = { -- Filetypes to disable lualine for.
        statusline = {},     -- only ignores the ft for statusline.
        winbar = { "qf" },   -- only ignores the ft for winbar.
      },
    },
    extensions = {
      "fugitive",
      "quickfix",
    },
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 500,
    },
    -- tabline = {
    --   lualine_a = { "buffers" },
    --   -- lualine_b = { "branch" },
    --   -- lualine_c = { "filename" },
    --   -- lualine_x = {},
    --   -- lualine_y = {},
    --   lualine_z = { "tabs" },
    -- },
    winbar = {
      lualine_a = {
        --   { "filename", path = 1 },
        "location",
        -- "progress",
      },
      lualine_b = {
        "aerial",
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {
        -- "diff",
      },
      lualine_z = {
      },
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    sections = {
      -- lualine_a = { "branch" },
      lualine_a = { "mode" },
      lualine_b = {
        makeprg,
        -- skk_mode
      },
      lualine_c = {
        -- "diagnostics",
        {
          'filename',
          path = 1,
        }
      },
      lualine_x = {
        lsp_names,
      },
      lualine_y = {
        "filetype",
        "encoding",
        "fileformat",
      },
      lualine_z = {
        -- "mode",
      },
    },
  }
end

local M = {
  { "petertriho/nvim-scrollbar", opts = {} },
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = "*",
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   setup = function()
  --     require('bufferline').setup {}
  --   end,
  -- },
  -- { "tiagovla/scope.nvim", config = true },
  -- {
  --   "backdround/tabscope.nvim",
  --   opts = {},
  -- },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
      'akinsho/bufferline.nvim',
    },
    -- init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      animation = false,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- setup()
      local f = evel_lualine
      f()
      vim.api.nvim_create_autocmd({ 'WinEnter', 'WinResized' }, {
        callback = function()
          f()
        end,
      })
    end,
  },
}

return M
