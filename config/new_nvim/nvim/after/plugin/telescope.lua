-- import the telescope
local builtin = require('telescope.builtin')

-- keymappings 
-- in normal mode <leader>pf to find files
vim.keymap.set('n', '<leader>pf', builtin.find_files, opts)

-- in normal mode ctrl+p to find files from git files
vim.keymap.set('n', '<C-p>', builtin.git_files, opts)

-- in normal mode <leader>ps for grep search in files
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, opts)


