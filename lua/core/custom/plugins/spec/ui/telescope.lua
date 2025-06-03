return -- Using lazy.nvim
{
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- { 'nvim-telescope/telescope-file-browser.nvim' } -- RIMOSSO
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup {
      -- RIMOSSA la configurazione extensions.file_browser
    }
    -- RIMOSSA la chiamata a load_extension("file_browser")
  end
}