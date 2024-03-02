local opt = vim.opt

-- Set the leader key before anything else
vim.g.mapleader = " "

opt.autowrite = true
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.inccommand = "nosplit"
opt.hlsearch = true
opt.incsearch = true
opt.laststatus = 0
opt.list = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.shiftround = true
opt.shiftwidth = 4
opt.showmode = false
opt.smartindent = true
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.termguicolors = true
opt.undofile = true
opt.undolevels = 10000
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
opt.wrap = false
opt.scrolloff = 8
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.ignorecase = true
opt.smartcase = true

vim.opt.clipboard = "unnamedplus"

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

-- Center the screen on search
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Workaround for WSL clipboard
--let g:clipboard = {
--    \   'name': 'WslClipboard',
--    \   'copy': {
--        \      '+': 'clip.exe',
--        \      '*': 'clip.exe',
--        \    },
--        \   'paste': {
--            \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--            \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--            \   },
--            \   'cache_enabled': 0,
--            \ }
