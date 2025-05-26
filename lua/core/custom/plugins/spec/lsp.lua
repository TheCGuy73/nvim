return {
  {
    -- Configurazione di nvim-lspconfig
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',          -- Richiede blink.cmp per le capacità LSP
      'williamboman/mason.nvim',   -- Consigliato per installare e gestire i Language Server
      'williamboman/mason-lspconfig.nvim', -- Integra Mason con nvim-lspconfig
    },
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- (Opzionale ma altamente consigliato) Configurazione di Mason e Mason-LSPconfig
      -- Questo ti permette di installare facilmente clangd (e altri server)
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { "clangd" }, -- Assicurati che clangd sia installato da Mason
        handlers = {
          -- Questo handler configura automaticamente tutti i server installati da Mason
          -- usando la funzione on_attach e le capacità di blink.cmp
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
              on_attach = function(client, bufnr)
                -- Mappature dei tasti comuni per LSP, definite qui
                -- Queste mappature saranno attive solo quando un LSP è collegato al buffer
                local buf_set_keymap = vim.api.nvim_buf_set_keymap
                local opts = { noremap = true, silent = true }

                -- Esempio di alcune mappature utili
                buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
                buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
                buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

                -- Abilita la formattazione automatica al salvataggio (se supportata dal server)
                if client.supports_method("textDocument/formatting") then
                  vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("Format", { clear = true }),
                    buffer = bufnr,
                    callback = function()
                      vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                  })
                end
              end,
              -- Aggiungi qui le impostazioni specifiche per clangd
              -- Ad esempio, per specificare gli argomenti di clangd
              -- cmd = { "clangd", "--background-index", "--compile-commands-dir=build" },
              -- root_dir = lspconfig.util.root_pattern('.git', 'compile_commands.json', 'Makefile', '.clangd'),
            })
          end,
        }
      })

      -- Configurazione manuale di clangd se non usi mason-lspconfig.nvim
      -- O se hai bisogno di configurazioni specifiche che non vuoi gestire tramite l'handler generale
      -- lspconfig.clangd.setup({
      --   capabilities = capabilities,
      --   on_attach = function(client, bufnr)
      --     -- Ripeti le mappature dei tasti e le auto-cmd qui, se non le gestisci tramite l'handler di mason-lspconfig
      --   end,
      --   -- Aggiungi qui le tue impostazioni specifiche per clangd
      --   -- cmd = { "clangd", "--background-index", "--compile-commands-dir=build" },
      --   -- root_dir = lspconfig.util.root_pattern('.git', 'compile_commands.json', 'Makefile', '.clangd'),
      -- })

      -- Configurazione globale delle diagnostiche di Neovim
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        float = {
          source = "always",
          focusable = false,
          header = "",
          prefix = "",
        },
      })
    end,
  },

}