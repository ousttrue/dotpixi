local M = {}

function M:setup()
  -- https://zenn.dev/kawarimidoll/books/6064bf6f193b51/viewer/b14229
  vim.opt.grepprg = table.concat({
    'rg',
    '--vimgrep',
    '--trim',
    '--hidden',
    [[--glob='!.git']],
    [[--glob='!*.lock']],
    [[--glob='!*-lock.json']],
    [[--glob='!*generated*']],
  }, ' ')
  vim.opt.grepformat = '%f:%l:%c:%m'

  -- ref: `:NewGrep` in `:help grep`
  vim.api.nvim_create_user_command('Grep', function(arg)
    local grep_cmd = 'silent grep! '
        .. (arg.bang and '--fixed-strings -- ' or '')
        .. vim.fn.shellescape(arg.args, true)
    vim.cmd(grep_cmd)
    if vim.fn.getqflist({ size = true }).size > 0 then
      vim.cmd.copen()
    else
      vim.notify('no matches found', vim.log.levels.WARN)
      vim.cmd.cclose()
    end
  end, { nargs = '+', bang = true, desc = 'Enhounced grep' })

  vim.keymap.set('n', '<space>/', ':Grep ', { desc = 'Grep' })
  vim.keymap.set('n', '<space>?', ':Grep <c-r><c-w>', { desc = 'Grep current word' })
  vim.keymap.set("n", "]q", ":cnewer<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "[q", ":colder<CR>", { noremap = true, silent = true })
end

return M
