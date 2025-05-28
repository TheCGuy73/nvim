return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },

  opts = {
    servers = {
      lua_ls = {},
      clangd = {},
      texlab = {},
    }
  },
  config = function(_, opts)
    local lspconfig = require('lspconfig')
    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end

  -- example calling setup directly for each LSP
  --[[
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local lspconfig = require('lspconfig')

    lspconfig['lua_ls'].setup({ capabilities = capabilities })
    lspconfig['clangd'].setup({ capabilities = capabilities })
    lspconfig['texlab'].setup({ capabilities = capabilities })
  end
  ]]
}