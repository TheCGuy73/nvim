-- Mappature Telescope con Meta + le lettere di "telescope"

local telescope = require('telescope.builtin')

vim.keymap.set('n', '<M-t>', telescope.find_files, { desc = '[?] Find files' })
vim.keymap.set('n', '<M-e>', telescope.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<M-l>', telescope.live_grep, { desc = '[G]rep' })
vim.keymap.set('n', '<M-s>', telescope.grep_string, { desc = '[S]earch current word' })
vim.keymap.set('n', '<M-c>', telescope.builtin, { desc = '[B]uiltin' })
vim.keymap.set('n', '<M-o>', telescope.lsp_document_symbols, { desc = '[O]utline' })
vim.keymap.set('n', '<M-p>', function() telescope.find_files({ hidden = true }) end, { desc = '[.] Find hidden files' })
vim.keymap.set('n', '<M-d>', '<cmd>Telescope diagnostics<cr>', { desc = "Find Diagnostics (Telescope)" })

-- Keymaps per le estensioni ufficiali di Telescope (ALT + lettera)
vim.keymap.set('n', '<M-f>', function() require('telescope').extensions.fzf.fzf() end, { desc = '[F]ZF extension' })
vim.keymap.set('n', '<M-u>', function() require('telescope').extensions["ui-select"].ui_select() end, { desc = '[U]I Select extension' })
vim.keymap.set('n', '<M-b>', function() require('telescope').extensions.file_browser.file_browser() end, { desc = '[B]rowser extension' })
vim.keymap.set('n', '<M-j>', function() require('telescope').extensions.project.project() end, { desc = '[J] Project extension' })
vim.keymap.set('n', '<M-m>', function() require('telescope').extensions.media_files.media_files() end, { desc = '[M]edia files extension' })