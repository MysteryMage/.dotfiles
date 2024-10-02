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
    {
        'williamboman/mason.nvim',
        dependencies = { 'williamboman/mason-lspconfig.nvim' },

        config = function()
            require('plugins_config.mason')
        end,
    },

    {
        'nvimtools/none-ls.nvim',
        event = { 'BufReadPre', 'BufNewFile' },

        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('plugins_config.null_ls')
        end,
    },

    'habamax/vim-alchemist',
    {
        dir = '~/dev/Plugins.nvim/tavern.nvim',
    },

    'kyazdani42/nvim-web-devicons',

    {
        'rebelot/heirline.nvim',

        config = function()
            require('plugins_config.heirline')
        end,
    },

    {
        'lewis6991/gitsigns.nvim',

        config = function()
            require('plugins_config.gitsigns')
        end,
    },

    {
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' },

        config = function()
            require('plugins_config.snippet')
        end,
    },

    {
        'brenoprata10/nvim-highlight-colors',

        config = function()
            require('nvim-highlight-colors').setup({
                render = 'virtual',
                virtual_symbol = '■',
                enable_named_colors = true,
                enable_tailwind = true,
            })
        end,
    },

    {
        'stevearc/oil.nvim',

        config = function()
            require('plugins_config.oil')
        end,
    },

    {
        'nmac427/guess-indent.nvim',

        config = function()
            require('plugins_config.guess_indent')
        end,
    },

    {
        'j-hui/fidget.nvim',

        config = function()
            require('plugins_config.fidget')
        end,
    },

    {
        'MeanderingProgrammer/markdown.nvim',
        main = 'render-markdown',
        opts = {},
        name = 'render-markdown',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    },

    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',

        dependencies = {
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind.nvim',
        },

        config = function()
            require('plugins_config.cmp')
        end,
    },

    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },

        config = function()
            require('plugins_config.lsp')
        end,
    },

    {

        'mfussenegger/nvim-dap',
        dependencies = 'rcarriga/nvim-dap-ui',

        config = function()
            require('plugins_config.dap')
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-context' },

        build = function()
            local treesitter_ok, treesitter_install = pcall(require, 'nvim-treesitter.install')

            if not treesitter_ok then
                return
            end
            treesitter_install.update({ with_sync = true })
        end,

        config = function()
            require('plugins_config.treesitter')
        end,
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
            require('plugins_config.telescope')
        end,
    },
}, lazy_opts)
