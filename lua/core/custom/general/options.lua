
vim.wo.number = true
vim.opt.guicursor = "a:block"
vim.opt.termguicolors = true
vim.opt.guifont = "Caskaydia Cove Nerd Font Mono:h12"
vim.opt.fillchars = { eob = " " }
vim.cmd.colorscheme "vercel"
vim.opt.background = "dark"
vim.opt.showmode = false
vim.opt.showtabline = 2
require('mini.statusline').setup()

