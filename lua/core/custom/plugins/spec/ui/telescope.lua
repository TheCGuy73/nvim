return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-project.nvim',
    'nvim-telescope/telescope-media-files.nvim',
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup {
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
        },
        media_files = {
          -- filetypes whitelist
          filetypes = {"png", "jpg", "mp4", "webm", "pdf"},
          find_cmd = "rg"
        }
      }
    }
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
    telescope.load_extension("file_browser")
    telescope.load_extension("project")
    telescope.load_extension("media_files")
  end
}