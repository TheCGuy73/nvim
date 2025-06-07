return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "clangd", "texlab" }, -- aggiungi gdscript qui
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
      if server_name == "clangd" then
        local compile_commands = vim.fn.getcwd() .. "/compile_commands.json"
        local cmd = { "clangd" }
        if vim.fn.filereadable(compile_commands) == 1 then
          table.insert(cmd, "--compile-commands-dir=" .. vim.fn.getcwd())
        end
        lspconfig.clangd.setup({
          cmd = cmd,
        })
      else
        lspconfig[server_name].setup({})
      end
    end
        lspconfig.gdscript.setup({
      -- Puoi aggiungere qui opzioni custom se vuoi
      -- root_dir = function() ... end,
      -- cmd = { "godot", "--headless", "--editor", "--lsp" },
    })

    -- Mostra warning quando apri o crei un file C/C++ e manca compile_commands.json
    for _, event in ipairs({ "BufReadPost", "BufNewFile" }) do
      vim.api.nvim_create_autocmd(event, {
        pattern = { "*.c", "*.cpp", "*.cxx", "*.cc", "*.h", "*.hpp", "*.hxx", "*.m", "*.mm" },
        callback = function()
          local compile_commands = vim.fn.getcwd() .. "/compile_commands.json"
          if vim.fn.filereadable(compile_commands) == 0 then
            vim.schedule(function()
              vim.notify("clangd: compile_commands.json non trovato nella directory corrente", vim.log.levels.WARN)
            end)
          end
        end,
      })
    end
  end,
}