-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

-- Telescope
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

-- Kanagawa (Colour scheme)
  use({
	  'rebelot/kanagawa.nvim',
	  as = 'kanagawa',
	  config = function()
		  vim.cmd("colorscheme kanagawa-wave")
	  end
  })
  
-- Treesitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- Harpoon
use ('ThePrimeagen/harpoon')

-- Undotree
use ('mbbill/undotree')

-- Vim Fugitive
use ('tpope/vim-fugitive')

-- Auto-tagger
use ('windwp/nvim-ts-autotag')

-- LSP Stuff
use ('VonHeikemen/lsp-zero.nvim')
-- Mason stuff
use ('williamboman/mason.nvim')
use ('williamboman/mason-lspconfig.nvim')
-- LSP Config
use ('neovim/nvim-lspconfig')
-- Autocompletion
use ('hrsh7th/nvim-cmp')
use ('hrsh7th/cmp-buffer')
use ('hrsh7th/cmp-path')
use ('saadparwaiz1/cmp_luasnip')
use ('L3MON4D3/LuaSnip')
use ('hrsh7th/cmp-nvim-lsp')
use ('hrsh7th/cmp-nvim-lua')
end)

