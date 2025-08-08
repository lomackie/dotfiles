return {
  {
    'mfussenegger/nvim-dap',
  },
  {
    'nvim-neotest/nvim-nio', -- add this line
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio', -- ensure it's included
    },
    config = function()
      require('dapui').setup()
    end,
  },
  {
    'ldelossa/nvim-dap-projects',
    dependencies = { 'mfussenegger/nvim-dap' },
  },
}
