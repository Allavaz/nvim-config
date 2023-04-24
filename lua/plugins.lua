local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'folke/tokyonight.nvim' },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    },
  },
  { "nvim-treesitter/nvim-treesitter",            build = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "HiPhish/nvim-ts-rainbow2" },
  { "windwp/nvim-ts-autotag" },
  { "github/copilot.vim" },
  { "nvim-telescope/telescope.nvim",              tag = "0.1.1",      dependencies = { "nvim-lua/plenary.nvim" } },
  { "christoomey/vim-tmux-navigator" },
  { "nvim-lualine/lualine.nvim" },
  { "tpope/vim-surround" },
  { "tpope/vim-commentary" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-repeat" },
  { "wellle/targets.vim" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "andymass/vim-matchup" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "kiyoon/treesitter-indent-object.nvim",
    keys = {
      {
        "ai",
        "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer()<CR>",
        mode = { "x", "o" },
        desc = "Select context-aware indent (outer)",
      },
      {
        "aI",
        "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer(true)<CR>",
        mode = { "x", "o" },
        desc = "Select context-aware indent (outer, line-wise)",
      },
      {
        "ii",
        "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner()<CR>",
        mode = { "x", "o" },
        desc = "Select context-aware indent (inner, partial range)",
      },
      {
        "iI",
        "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner(true)<CR>",
        mode = { "x", "o" },
        desc = "Select context-aware indent (inner, entire range)",
      },
    },
  },
  { "vim-scripts/ReplaceWithRegister" }
})
