-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>x', ':Neotree toggle current reveal_force_cwd<CR>', desc = 'NeoTree toggle cwd', silent = true },
    { '|', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { 'gd', ':Neotree float reveal_file=<cfile> reveal_force_cwd<CR>', desc = 'NeoTree reveal file', silent = true },
    { '<leader>b', ':Neotree toggle show buffers right<CR>', desc = 'NeoTree buffers', silent = true },
    { '<leader>g', ':Neotree float git_status<CR>', desc = 'NeoTree git status', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
