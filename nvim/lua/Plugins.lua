return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'dstein64/vim-startuptime'
    use 'lewis6991/impatient.nvim'
    use 'nathom/filetype.nvim'

    use 'habamax/vim-alchemist'
    use { 'catppuccin/nvim', as = 'catppuccin' }

    use 'feline-nvim/feline.nvim'

    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'lewis6991/gitsigns.nvim'

    use 'numToStr/Comment.nvim'
    use 'norcalli/nvim-colorizer.lua'

    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'quangnguyen30192/cmp-nvim-ultisnips'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    }
    use 'TimUntersberger/neogit'

    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'

    use 'rust-lang/rust.vim'

    use {
        'nvim-neorg/neorg',
        requires = 'nvim-lua/plenary.nvim'
    }
end)
