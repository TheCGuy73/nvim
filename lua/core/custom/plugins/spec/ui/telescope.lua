return -- Using lazy.nvim
{
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Required for file_browser
    { 'nvim-telescope/telescope-file-browser.nvim' }
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup {
      extensions = {
        file_browser = {
          -- Configuration options for file_browser here (optional)
          -- For example, to show hidden files:
          -- hidden = true,
        },
      },
    }
    -- Load the extension
   
  end
}