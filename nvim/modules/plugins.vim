"Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'habamax/vim-alchemist'
Plug 'haystackandroid/strawberry'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" Plug 'nvim-lualine/lualine.nvim'
Plug 'feline-nvim/feline.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lewis6991/gitsigns.nvim'

Plug 'rstacruz/vim-closer'
Plug 'numToStr/Comment.nvim'
Plug 'machakann/vim-highlightedyank'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sbdchd/neoformat'
Plug 'TimUntersberger/neogit'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'rust-lang/rust.vim'
Plug 'stevearc/vim-arduino'
call plug#end()
