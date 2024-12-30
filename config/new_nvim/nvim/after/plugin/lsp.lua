-- import from lsp-zero
local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")
local cmp = require("cmp")

-- setup the mason and mason-lspconfig
require("mason").setup()
require("mason-lspconfig").setup()

-- it is used for default lsp
lsp.preset("recommended")

-- lsp-zero configs
local lsp_attach = function(client, bufnr)
	local opts = {buffer = bufnr}

	-- to get explaination about variable and function
	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)

	-- to get to the definition of variable and function
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)

	-- to get to the declaration of variable and function
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

	-- to get to the implementation of variable and function
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)

	-- to get to the type definition of variable and function
	vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definiition()<cr>", opts)

	-- to get to the references of variable and function
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

	-- to get to the signature help of variable and function
	vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

	-- to rename variable and function
	vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

	-- to format the code
	vim.keymap.set({"n", "x"}, "<F3>", "<cmd>lua vim.lsp.buf.format()<cr>", opts)

	-- code-action
	vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

	-- auto format the code on save
	lsp.buffer_autoformat()
	-- assign our config to lsp
	lsp.default_keymaps({buffer=bufnr})

end

-- add our changes to lsp
lsp.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
})

-- typescript server config
-- lsp.config.ts_ls.setup({})
-- python server config
-- lsp.config.pyright.setup({})

-- auto completion setup
cmp.setup({
	sources = {
		{ name = "nvim_lsp" }
	},
	snippet = {
		expand = function(args)
			-- need neovim v0.10 or later
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
})

-- now start lsp
lsp.setup()
