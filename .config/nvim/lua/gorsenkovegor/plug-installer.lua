local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Дерево изменений
    {"mbbill/undotree"},
    -- Подсветка синтаксиса
    { "nvim-treesitter/nvim-treesitter" },
    -- Авто коментарий
    {"numToStr/Comment.nvim"},
    -- Поисковой движок
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    }, 
    -- Гарпун 
    {"ThePrimeagen/harpoon"},

    -- Цветовая схема
    {"luisiacc/gruvbox-baby"},
    { "rose-pine/neovim", name = "rose-pine" },

    -- lsp 
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},

    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-cmdline"},
    {"hrsh7th/cmp-vsnip"},
    {"hrsh7th/vim-vsnip"},

    -- null ls 
    {"jose-elias-alvarez/null-ls.nvim"},
    {
          "lervag/vimtex",
          lazy = false,     -- we don't want to lazy load VimTeX
          -- tag = "v2.15", -- uncomment to pin to a specific release
          init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
          end
    }
})
