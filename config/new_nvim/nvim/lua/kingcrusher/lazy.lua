-- checks and import the lazy vim 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- plugins to import 
require("lazy").setup({
	-- add the telescope plugin:
	{
	    'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	      dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- add the rose-pine colorscheme plugin:
	{"rose-pine/neovim", name="rose-pine"},

	-- add the treesitter plugin:
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

	-- add the harpoon plugin:
	{"theprimeagen/harpoon", name = "harpoon"},
	
	-- add the undotree plugin:
	{"mbbill/undotree", name = "undotree"},

	-- add the undotree plugin:
	{"tpope/vim-fugitive", name = "fugitive"},

	-- add the lsp-zero plugin and its dependencies:
	{"VonHeikemen/lsp-zero.nvim", name = "lsp-zero"},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},

	-- add the mason plugin:
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
})
