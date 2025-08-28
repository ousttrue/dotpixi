return {
  -- fzf
  -- {
  --   "ibhagwan/fzf-lua",
  --   -- optional for icon support
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   -- or if using mini.icons/mini.nvim
  --   -- dependencies = { "echasnovski/mini.icons" },
  --   config = function()
  --     require("fzf-lua").setup()
  --
  --     -- vim.keymap.set("n", "<space>g", "<cmd>FzfLua live_grep<CR>", { noremap = true })
  --     vim.keymap.set("n", "<space>g", "<cmd>FzfLua grep_cword<CR>", { noremap = true })
  --     vim.keymap.set("n", "<space>b", "<cmd>FzfLua buffers<CR>", { noremap = true })
  --     -- vim.keymap.set("n", "<space>f", "<cmd>FzfLua files<CR>", { noremap = true })
  --     vim.keymap.set("n", "<space>l", "<cmd>FzfLua live_grep<CR>", { noremap = true })
  --   end
  -- },
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  {
    "linrongbin16/fzfx.nvim",
    -- Optional to avoid break changes between major versions.
    version = "v8.*",
    dependencies = { "nvim-tree/nvim-web-devicons", 'junegunn/fzf' },
    config = function()
      require("fzfx").setup {
        override_fzf_opts = {
          { "--preview-window", "top,40%" },
        },
      }

      -- ======== files ========

      -- by args
      vim.keymap.set(
        "n",
        "<space>f",
        "<cmd>FzfxFiles<cr>",
        { silent = true, noremap = true, desc = "Find files" }
      )
      -- by visual select
      vim.keymap.set(
        "x",
        "<space>f",
        "<cmd>FzfxFiles visual<CR>",
        { silent = true, noremap = true, desc = "Find files" }
      )
      -- by cursor word
      vim.keymap.set(
        "n",
        "<space>wf",
        "<cmd>FzfxFiles cword<cr>",
        { silent = true, noremap = true, desc = "Find files by cursor word" }
      )
      -- by yank text
      vim.keymap.set(
        "n",
        "<space>pf",
        "<cmd>FzfxFiles put<cr>",
        { silent = true, noremap = true, desc = "Find files by yank text" }
      )
      -- by resume
      vim.keymap.set(
        "n",
        "<space>rf",
        "<cmd>FzfxFiles resume<cr>",
        { silent = true, noremap = true, desc = "Find files by resume last" }
      )

      -- ======== live grep ========

      -- live grep
      vim.keymap.set(
        "n",
        "<space>l",
        "<cmd>FzfxLiveGrep<cr>",
        { silent = true, noremap = true, desc = "Live grep" }
      )
      -- by visual select
      vim.keymap.set(
        "x",
        "<space>l",
        "<cmd>FzfxLiveGrep visual<cr>",
        { silent = true, noremap = true, desc = "Live grep" }
      )
      -- by cursor word
      vim.keymap.set(
        "n",
        "<space>wl",
        "<cmd>FzfxLiveGrep cword<cr>",
        { silent = true, noremap = true, desc = "Live grep by cursor word" }
      )
      -- by yank text
      vim.keymap.set(
        "n",
        "<space>pl",
        "<cmd>FzfxLiveGrep put<cr>",
        { silent = true, noremap = true, desc = "Live grep by yank text" }
      )
      -- by resume
      vim.keymap.set(
        "n",
        "<space>rl",
        "<cmd>FzfxLiveGrep resume<cr>",
        { silent = true, noremap = true, desc = "Live grep by resume last" }
      )

      -- ======== buffers ========

      -- by args
      vim.keymap.set(
        "n",
        "<space>bf",
        "<cmd>FzfxBuffers<cr>",
        { silent = true, noremap = true, desc = "Find buffers" }
      )

      -- ======== git files ========

      -- by args
      vim.keymap.set(
        "n",
        "<space>gf",
        "<cmd>FzfxGFiles<cr>",
        { silent = true, noremap = true, desc = "Find git files" }
      )

      -- ======== git live grep ========

      -- by args
      vim.keymap.set(
        "n",
        "<space>gl",
        "<cmd>FzfxGLiveGrep<cr>",
        { silent = true, noremap = true, desc = "Git live grep" }
      )
      -- by visual select
      vim.keymap.set(
        "x",
        "<space>gl",
        "<cmd>FzfxGLiveGrep visual<cr>",
        { silent = true, noremap = true, desc = "Git live grep" }
      )
      -- by cursor word
      vim.keymap.set(
        "n",
        "<space>wgl",
        "<cmd>FzfxGLiveGrep cword<cr>",
        { silent = true, noremap = true, desc = "Git live grep by cursor word" }
      )
      -- by yank text
      vim.keymap.set(
        "n",
        "<space>pgl",
        "<cmd>FzfxGLiveGrep put<cr>",
        { silent = true, noremap = true, desc = "Git live grep by yank text" }
      )
      -- by resume
      vim.keymap.set(
        "n",
        "<space>rgl",
        "<cmd>FzfxGLiveGrep resume<cr>",
        { silent = true, noremap = true, desc = "Git live grep by resume last" }
      )

      -- ======== git changed files (status) ========

      -- by args
      vim.keymap.set(
        "n",
        "<space>gs",
        "<cmd>FzfxGStatus<cr>",
        { silent = true, noremap = true, desc = "Find git changed files (status)" }
      )

      -- ======== git branches ========

      -- by args
      vim.keymap.set(
        "n",
        "<space>br",
        "<cmd>FzfxGBranches<cr>",
        { silent = true, noremap = true, desc = "Search git branches" }
      )

      -- ======== git commits ========

      -- by args
      vim.keymap.set(
        "n",
        "<space>gc",
        "<cmd>FzfxGCommits<cr>",
        { silent = true, noremap = true, desc = "Search git commits" }
      )

      -- ======== git blame ========

      -- by args
      vim.keymap.set(
        "n",
        "<space>gb",
        "<cmd>FzfxGBlame<cr>",
        { silent = true, noremap = true, desc = "Search git blame" }
      )

      -- ======== lsp diagnostics ========

      -- by args
      vim.keymap.set(
        "n",
        "<space>dg",
        "<cmd>FzfxLspDiagnostics<cr>",
        { silent = true, noremap = true, desc = "Search lsp diagnostics" }
      )

      -- ======== lsp symbols ========

      -- lsp definitions
      vim.keymap.set(
        "n",
        "gd",
        "<cmd>FzfxLspDefinitions<cr>",
        { silent = true, noremap = true, desc = "Goto lsp definitions" }
      )

      -- lsp type definitions
      vim.keymap.set(
        "n",
        "gt",
        "<cmd>FzfxLspTypeDefinitions<cr>",
        { silent = true, noremap = true, desc = "Goto lsp type definitions" }
      )

      -- lsp references
      vim.keymap.set(
        "n",
        "gr",
        "<cmd>FzfxLspReferences<cr>",
        { silent = true, noremap = true, desc = "Goto lsp references" }
      )

      -- lsp implementations
      vim.keymap.set(
        "n",
        "gi",
        "<cmd>FzfxLspImplementations<cr>",
        { silent = true, noremap = true, desc = "Goto lsp implementations" }
      )

      -- lsp incoming calls
      vim.keymap.set(
        "n",
        "gI",
        "<cmd>FzfxLspIncomingCalls<cr>",
        { silent = true, noremap = true, desc = "Goto lsp incoming calls" }
      )

      -- lsp outgoing calls
      vim.keymap.set(
        "n",
        "gO",
        "<cmd>FzfxLspOutgoingCalls<cr>",
        { silent = true, noremap = true, desc = "Goto lsp outgoing calls" }
      )

      -- ======== vim commands ========

      -- by args
      vim.keymap.set(
        "n",
        "<space>cm",
        "<cmd>FzfxCommands<cr>",
        { silent = true, noremap = true, desc = "Search vim commands" }
      )

      -- ======== vim key maps ========

      -- by args
      vim.keymap.set(
        "n",
        "<space>km",
        "<cmd>FzfxKeyMaps<cr>",
        { silent = true, noremap = true, desc = "Search vim keymaps" }
      )

      -- ======== vim marks ========

      -- by args
      vim.keymap.set(
        "n",
        "<space>mk",
        "<cmd>FzfxMarks<cr>",
        { silent = true, noremap = true, desc = "Search vim marks" }
      )

      -- ======== file explorer ========

      -- by args
      vim.keymap.set(
        "n",
        "<space>xp",
        "<cmd>FzfxFileExplorer<cr>",
        { silent = true, noremap = true, desc = "File explorer" }
      )
    end,
  },
}
