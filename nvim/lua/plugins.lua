local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local lazy_ok, lazy = pcall(require, 'lazy')
if not lazy_ok then
    vim.api.nvim_err_writeln('Failed to load lazy')
    return
end

local lazy_opts = {
    ui = {
        border = 'rounded',
    },
}

lazy.setup({
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    'nvimtools/none-ls.nvim',

    'habamax/vim-alchemist',
    {
        dir = '~/dev/Plugins.nvim/tavern.nvim',
    },
    'luisiacc/gruvbox-baby',

    'kyazdani42/nvim-web-devicons',
    'stevearc/dressing.nvim',
    'feline-nvim/feline.nvim',

    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',

    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',

    'numToStr/Comment.nvim',
    'norcalli/nvim-colorizer.lua',
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({})
        end,
    },
    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup({})
        end,
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    'stevearc/oil.nvim',
    'nmac427/guess-indent.nvim',

    'preservim/vim-markdown',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'saadparwaiz1/cmp_luasnip',

    'neovim/nvim-lspconfig',
    'onsails/lspkind.nvim',
    'mfussenegger/nvim-dap',
    {
        'rcarriga/nvim-dap-ui',
        dependencies = 'mfussenegger/nvim-dap',
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            local treesitter_ok, treesitter_install = pcall(require, 'nvim-treesitter.install')

            if not treesitter_ok then
                return
            end
            treesitter_install.update({ with_sync = true })
        end,
    },
    'nvim-treesitter/nvim-treesitter-context',

    'nvim-telescope/telescope.nvim',
    {
        "dzfrias/arena.nvim",
        event = "BufWinEnter",
        config = true,
    },

    'rust-lang/rust.vim',

    'nvim-lua/plenary.nvim',
}, lazy_opts)
