--[[ keys.lua ]]
local opts = {noremap = true, silent = true}
local term_opts = {silent = true} 
local keymap = vim.api.nvim_set_keymap


-- keymap ('n', '-', ':Lex 30<cr>', opts)
keymap ('n', '-', ':NvimTreeToggle<CR>', opts)

-- Navigate Buffers
keymap('n', '<Tab>', ':bnext<CR>', opts)
keymap('n', '<S-Tab>', ':bprevious<CR>', opts)

-- Keep yank in the register
keymap('v', 'p', '"_dP', opts)

-- Tabs
keymap('n', 'to', ':tabnew<CR>', opts)
keymap('n', 'GT', ':tabp<CR>', opts)
keymap('n', 'gT', ':tabp<CR>', opts)

-- Window
keymap('n', '<Leader>sm', ':MaximizerToggle<CR>', opts)

-- Telescope
keymap('n', '<Leader>ff', '<CMD>Telescope find_files<CR>', opts)
keymap('n', '<Leader>fs', '<CMD>Telescope live_grep<CR>', opts)
keymap('n', '<Leader>fc', '<CMD>Telescope grep_string<CR>', opts)
keymap('n', '<Leader>fb', '<CMD>Telescope buffers<CR>', opts)
keymap('n', '<Leader>fh', '<CMD>Telescope help_tags<CR>', opts)
