-- External plugins managed with packer.nvim
--
-- The plugin configuration is required inline with the plugin declaration,
-- which makes it possible to temporarily disable a plugin by just commenting
-- the declaration.

--- Requires a plugin configuration.
---@param cfg The name of the config to require.
local r = function(cfg)
  local module = string.format('dkg.configs.%s', cfg)
  local ok, err = pcall(require, module)
  if not ok then
    print(string.format('Error %s: %s', cfg, err))
  end
end

local function plugins()
  use { 'wbthomason/packer.nvim' }
  -- use { 'lewis6991/impatient.nvim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-surround', config = r'surround' }
  use { 'tpope/vim-abolish', cmd = 'S' }
  use { 'tpope/vim-fugitive', config = r'fugitive' }
  use { 'tpope/vim-repeat' }
  use { 'numToStr/Navigator.nvim', config = r'navigator' }
  use { 'justinmk/vim-dirvish' }
  use { 'danymat/neogen', requires = 'nvim-treesitter/nvim-treesitter', config = r'neogen' }
  -- use { 'norcalli/nvim-colorizer.lua', cmd = 'ColorizerAttachToBuffer' }
  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim', config = r'gitsigns' }
  use { 'bakpakin/fennel.vim' }
  use { 'lukas-reineke/indent-blankline.nvim', config = r'indent-blankline' }
  -- use { 'alec-gibson/nvim-tetris', cmd = 'Tetris' }
  -- use { 'jbyuki/venn.nvim', config = r'venn' }
  -- use { 'mfussenegger/nvim-dap', config = r'dap' }
  -- use { 'rcarriga/nvim-dap-ui' }
  use { 'ziglang/zig.vim' }
  use {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup {
        style = 'night',
        styles = {
          comments = { italic = true },
          keywords = { italic = false },
        },
      }
      -- vim.g.tokyonight_italic_keywords = false
      vim.cmd.colorscheme 'tokyonight'
      vim.cmd [[hi! link EndOfBuffer NonText]]
      vim.cmd [[hi! link WinSeparator Function]]
      -- vim.cmd [[hi! link Comment Question]]
    end
  }
  use {
    'dasupradyumna/midnight.nvim',
    config = function()
      -- vim.cmd.colorscheme 'midnight'
    end
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = r'telescope'
  }
  use {
    'L3MON4D3/LuaSnip',
    config = r'luasnip',
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'quangnguyen30192/cmp-nvim-tags',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim',
      'kyazdani42/nvim-web-devicons'
    },
    config = r'nvim-cmp'
  }
  use {
    'windwp/nvim-autopairs',
    config = function()
      require'nvim-autopairs'.setup{}
    end
  }
  use {
    'AckslD/nvim-trevJ.lua',
    config = 'require("trevj").setup()',
    setup = function()
      vim.keymap.set('n', '<leader>l', function()
        require'trevj'.format_at_cursor()
      end)
    end,
  }
  use {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function()
      require('fidget').setup{}
    end
  }
  use { '~/code/vim/scnvim', config = r'scnvim' }
  use { '~/code/vim/scnvim-logger' }
  use { '~/code/vim/scnvim-tmux' }
  use { '~/code/vim/scnvim-level_meter' }
  use { '~/code/vim/nvim-markdown-preview' }
  use {
    '~/code/vim/replay.nvim',
    config = function()
      local replay = require'replay'
      replay.setup{
        output_path = "~/Documents/replay.nvim",
      }
      vim.keymap.set('n', '<F5>', function() replay.record('test') end)
      vim.keymap.set('n', '<F7>', function() replay.play('test') end)
      vim.keymap.set('n', '<F8>', function() replay.toggle_pause() end)
    end
  }
  use {'~/code/vim/telescope-scdoc' }
  use {
    '~/code/vim/oblique-strategies.nvim',
    config = function()
      require('oblique-strategies').setup{
        keymaps = {
          show = {
            n = '<F9>',
          },
        },
      }
    end
  }
end

local packer_config = {
  display = {
    open_fn = function()
      return require'packer.util'.float({ border = 'single' })
    end
  }
}

require'packer'.startup({plugins, config = packer_config})
