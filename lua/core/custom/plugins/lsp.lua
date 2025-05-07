return {
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    },
    config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
  
    lspconfig.clangd.setup {
      capabilities = cmp_nvim_lsp.default_capabilities(),
      cmd = { "clangd", "--compile-commands-dir=." },
      -- Altre configurazioni specifiche per clangd se necessario
    }
    lspconfig.pylsp.setup {
      -- Opzionale: impostazioni specifiche per pylsp
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = { enabled = false }, -- Disabilita pycodestyle se preferisci un altro linter
            flake8 = { enabled = true },       -- Abilita flake8 (se installato con pip)
            pylint = { enabled = false },       -- Disabilita pylint se non lo usi
            -- Altre configurazioni per i plugin di pylsp
          }
        }
      },
      -- Opzionale: funzioni di `on_attach` specifiche per Python
      on_attach = function(client, bufnr)
        -- Qui puoi definire keymaps specifici per Python LSP
        -- (vedi esempi nella documentazione di nvim-lspconfig)
      end,
    }
  
    -- Esempio per un altro LSP (opzionale)
    -- lspconfig.lua_ls.setup {
    --   settings = {
    --     Lua = {
    --       workspace = { checkThirdParty = false },
    --       telemetry = { enable = false },
    --     },
    --   },
    -- }
    end,
  },
  }