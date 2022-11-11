local packer_ok, packer = pcall(require, 'packer')
if not packer_ok then
    vim.api.nvim_err_writeln('Failed to load packer')
    return
end

packer.init({
    display = {
        open_fn = function()
            local packer_util = require('packer.util')
            return packer_util.float({ border = 'rounded' })
        end
    }
})

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'jose-elias-alvarez/null-ls.nvim'

    use 'lewis6991/impatient.nvim'

    use 'habamax/vim-alchemist'
    use {
        '~/Programming/Plugins.nvim/tavern.nvim',
        requires = 'rktjmp/lush.nvim'
    }

    use 'kyazdani42/nvim-web-devicons'
    use 'stevearc/dressing.nvim'
    use 'feline-nvim/feline.nvim'

    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'

    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    use 'numToStr/Comment.nvim'
    use 'norcalli/nvim-colorizer.lua'

    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup {}
        end
    }

    use 'elihunter173/dirbuf.nvim'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'

    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local treesitter_ok, treesitter_install =
            pcall(require, 'nvim-treesitter.install')

            if not treesitter_ok then
                return
            end
            treesitter_install.update({ with_sync = true })
        end,
    }

    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'

    use 'rust-lang/rust.vim'
    use 'mfussenegger/nvim-jdtls'

    use 'nvim-lua/plenary.nvim'
end)
