local function g_match(src, pattern)
  local _s, _e = src:find(pattern)
  ---@type {s: integer?, e:integer?}
  local context = {
    s = _s,
    e = _e,
  }

  return function()
    if not context.e then
      return
    end
    local m = src:sub(context.s, context.e)

    local s, e = src:find(pattern, context.e + 1)
    local body
    if s and e then
      body = src:sub(context.e + 1, s - 1)
      context.s = s
      context.e = e
    else
      body = src:sub(context.e + 1)
      context.s = nil
      context.e = nil
    end
    return m, body
  end
end

local GHQ_ROOT = vim.env["GHQ_ROOT"] or (vim.env['HOME'] .. '/ghq')
---@type LazySpec[]
local config = {
  {
    name = "ousttrue/neomarkdown.nvim",
    dependencies = { "uga-rosa/utf8.nvim" },
    enabled = false,
    dir = GHQ_ROOT .. "/github.com/ousttrue/neomarkdown.nvim",
    dev = false,
    config = function()
      local HtmlAnchor = require "neomarkdown.HtmlAnchor"
      local Url = require "neomarkdown.Url"
      require("neomarkdown").setup {
        filters = {
          function(url, content)
            if url:find "^https://www.google.com/search" then
              local links = {}
              for m, body in g_match(content, "<a%s[^>]*>.-</a>") do
                local a = HtmlAnchor.parse(m)
                local href = a.href
                if href then
                  if href.src:find "support.google.com" then
                  elseif href.src:find "accounts.google.com" then
                  elseif href.path == "/url" then
                    if bl.skip_url(href.query.q) then
                    else
                      table.insert(
                        links,
                        ('<h1><a href="%s">%s</a></h1>'):format(href.query.q, a.text:gsub("[%[%]]", "_"))
                      )
                      table.insert(links, body)
                    end
                  elseif href.src:find "start=" then
                    table.insert(
                      links,
                      ('<h1><a href="%s">%s</a></h1>'):format(
                        href:format {
                          query_filter = function(k, v)
                            if k == "q" or k == "start" then
                              return k, v
                            end
                          end,
                        },
                        a.text
                      )
                    )
                  end
                end
              end

              return ("<html><body>%s</body></html>"):format(table.concat(links, "\n"))
            end
          end,
        },
      }
    end,

  }
}

return config
