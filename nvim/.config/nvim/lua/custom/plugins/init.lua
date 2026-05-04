return {
  {
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup {
        lsp_cfg = false,       -- keep our existing gopls config
        lsp_on_attach = false, -- keep our existing LspAttach handlers
        lsp_gofumpt = false,   -- keep goimports for formatting
        dap_debug = false,     -- keep our existing dap setup
      }
    end,
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()',
  },
}
