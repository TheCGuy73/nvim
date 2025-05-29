-- Mappature Telescope con Meta + le lettere di "telescope"

local telescope = require('telescope.builtin')

vim.keymap.set('n', '<M-t>', telescope.find_files, { desc = '[?] Find files' })
vim.keymap.set('n', '<M-e>', telescope.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<M-l>', telescope.live_grep, { desc = '[G]rep' })
vim.keymap.set('n', '<M-s>', telescope.grep_string, { desc = '[S]earch current word' })
vim.keymap.set('n', '<M-c>', telescope.builtin, { desc = '[B]uiltin' })
vim.keymap.set('n', '<M-o>', telescope.lsp_document_symbols, { desc = '[O]utline' })
vim.keymap.set('n', '<M-p>', function() telescope.find_files({ hidden = true }) end, { desc = '[.] Find hidden files' })
pcall(require('telescope').load_extension, 'file_browser')
vim.keymap.set('n', '<M-f>', function()
  require('telescope').extensions.file_browser.file_browser({ path = "%:p:h" })
end, { desc = '[F]ile Browser' })
