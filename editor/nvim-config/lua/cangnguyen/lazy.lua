vim.g.mapleader = ","

require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.2',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    { "ellisonleao/gruvbox.nvim" },

    { 'nvim-treesitter/nvim-treesitter' },
    { 'tpope/vim-fugitive' },

    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },

    { 'williamboman/mason.nvim' },
    { "williamboman/mason-lspconfig.nvim" },

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    { 'airblade/vim-gitgutter' },
    -- Amazing commentter
    { 'preservim/nerdcommenter' },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },

    { 'lvimuser/lsp-inlayhints.nvim' },

    -- Standalone UI for nvim-lsp progress
    { 'j-hui/fidget.nvim' },

    -- Java config
    { 'mfussenegger/nvim-jdtls' },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    }
})
