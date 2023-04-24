require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  rainbow = { enable = true },
  context_commentstring = { enable = true },
  matchup = { enable = true },
  playground = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  auto_install = true
})

