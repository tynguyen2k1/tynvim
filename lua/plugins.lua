-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
-- end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Theme
  use 'folke/tokyonight.nvim'
  -- Status line
  use {
    'glepnir/galaxyline.nvim',
      branch = 'main',
      -- some optional icons
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  -- Buffer
  use "romgrk/barbar.nvim"
  -- For hex color
  use 'norcalli/nvim-colorizer.lua'
  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = function ()
      require('plugins.nvimtree').setup()
    end,
    requires = 'kyazdani42/nvim-web-devicons'
  }
  -- find file
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-lua/popup.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- Comment
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- comment chuan hon

  -- Neovim LSP
  use 'neovim/nvim-lspconfig'
  -- use {
  --   'jose-elias-alvarez/null-ls.nvim',
  --   config = function ()
  --     require('plugins.null-ls').setup()
  --   end,
  --   requires = 'nvim-lua/plenary.nvim'
  -- }
  -- Tab/Auto completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-cmdline'
  use 'antoinemadec/FixCursorHold.nvim'

  -- snippets
  -- use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets" -- snippets co san
  -- lsp installer
  use 'williamboman/nvim-lsp-installer' -- trinh quan ly lsp
  -- Auto pairs '', "", [], {}, (), ``
  use 'windwp/nvim-autopairs'
  -- For indent line
  use 'lukas-reineke/indent-blankline.nvim'
  -- For nice highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    -- run = ':TSUpdate'
  }
  -- matchup
  use {
    'andymass/vim-matchup',
    config = function ()
      require("plugins.vim-matchup").config()
    end
  }
  -- Smooth scrolling
  use {
    'karb94/neoscroll.nvim',
    config = function ()
      require('neoscroll').setup()
    end
  }
  -- Tmux navigator
  use 'christoomey/vim-tmux-navigator'
  -- Git
  use "lewis6991/gitsigns.nvim"
  -- float terminal
  use 'akinsho/toggleterm.nvim'
  -- Hop, use for easy motion
  use {
    'phaazon/hop.nvim',
    setup = function ()
      require("keybinds").hop()
    end,
    config = function ()
      require('hop').setup()
    end
  }
  -- Auto tag
  use 'windwp/nvim-ts-autotag'
  --change (){}[], tag
  use 'tpope/vim-surround'
  -- using . repeat surround.vim
  use 'tpope/vim-repeat'
  -- highlight current word
  use {
    'RRethy/vim-illuminate',
    config = function ()
      vim.g.Illuminate_delay = 300
      vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
      vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
      vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]
      -- vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
      -- vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
    end,
    requires = 'neovim/nvim-lspconfig'
  }

  -- Live server
  use 'turbio/bracey.vim'

end)
