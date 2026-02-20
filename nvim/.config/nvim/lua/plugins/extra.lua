return {
      {
        'nvim-lua/plenary.nvim',
    },
    {
        'kdheepak/lazygit.nvim',
        -- optional for floating window border decoration
        dependencies = 'nvim-lua/plenary.nvim',
    },
    {
        'ThePrimeagen/git-worktree.nvim'
    },
    {
        'christoomey/vim-tmux-navigator'
    },
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        opts = { signs = false }
    },
  -- Autotags
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },

  -- comments
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  -- Neovim notifications and LSP progress messages
  {
    "j-hui/fidget.nvim",
  },
  -- Heuristically set buffer options
  {
    "tpope/vim-sleuth",
  },
  {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
          library = {
              -- See the configuration section for more details
              -- Load luvit types when the `vim.uv` word is found
              { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
      },
  },

  -- editor config support
  {
    "editorconfig/editorconfig-vim",
  },

--  {
--    "folke/flash.nvim",
--    event = "VeryLazy",
--    ---@type Flash.Config
--    opts = {},
--    -- stylua: ignore
--    keys = {
--      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
--      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
--      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
--      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
--      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
--    },
--  },
  {
    "nvim-mini/mini.nvim",
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup({ n_lines = 500 })

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup()

      require("mini.pairs").setup()

      -- local statusline = require("mini.statusline")
      -- statusline.setup({
      --   use_icons = vim.g.have_nerd_font,
      -- })
      -- ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return "%2l:%-2v"
      -- end
    end,
  },

  {
    "echasnovski/mini.icons",
    enabled = true,
    opts = {},
    lazy = true,
  },

  {
    "fladson/vim-kitty",
    "MunifTanjim/nui.nvim",
  },
}
