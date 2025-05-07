-- Mappature Telescope con Meta + le lettere di "telescope"

local telescope = require('telescope.builtin')
local map = vim.keymap.set

map('n', '<M-t>', telescope.find_files, { desc = '[?] Find files' })
map('n', '<M-e>', telescope.buffers, { desc = '[ ] Find existing buffers' })
map('n', '<M-l>', telescope.live_grep, { desc = '[G]rep' })
map('n', '<M-s>', telescope.grep_string, { desc = '[S]earch current word' })
map('n', '<M-c>', telescope.builtin, { desc = '[B]uiltin' })
map('n', '<M-o>', telescope.lsp_document_symbols, { desc = '[O]utline' })
map('n', '<M-p>', function() telescope.find_files({ hidden = true }) end, { desc = '[.] Find hidden files' })