return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'habamax/vim-alchemist'
    use 'haystackandroid/strawberry'
    use { "catppuccin/nvim", as = "catppuccin" }

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
end)
