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
      ensure_installed = { "clangd", "texlab" }, -- aggiungi qui i server che vuoi
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local mason_lspconfig = require("mason-lspconfig")
    for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
      lspconfig[server_name].setup({
        capabilities = capabilities,
      })
    end
  end,
}