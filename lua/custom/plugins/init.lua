-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    lazy = true,
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    opts = {
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      -- Treesitter 节点跳转（核心功能）
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },

      -- Treesitter 搜索
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },

      -- 远程操作
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
    },
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          week_header = { enable = true },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
          },
        },
      }
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    -- 当执行 :ToggleTerm 命令时加载
    cmd = 'ToggleTerm',
    -- 当按下快捷键时加载
    keys = {
      -- 主终端：浮动窗口
      { '<C-t>', '<cmd>ToggleTerm direction=float<cr>', desc = 'Toggle float terminal', mode = { 'n', 't' } },
    },
    config = function()
      require('toggleterm').setup {
        size = 20,
        direction = 'float',
        float_opts = { border = 'rounded' },
      }
    end,
  },
  {
    'xTacobaco/cursor-agent.nvim',
    config = function()
      vim.keymap.set('n', '<leader>ca', ':CursorAgent<CR>', { desc = 'Cursor Agent: Toggle terminal' })
      vim.keymap.set('v', '<leader>ca', ':CursorAgentSelection<CR>', { desc = 'Cursor Agent: Send selection' })
      vim.keymap.set('n', '<leader>cA', ':CursorAgentBuffer<CR>', { desc = 'Cursor Agent: Send buffer' })
    end,
  },
}
