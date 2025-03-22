local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")
local cmp = require('cmp')
require("mason").setup()
require("mason-lspconfig").setup()

lsp.preset("recommended")

local lsp_attach = function(client, bufnr)
  local opts = {buffer = bufnr}

  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

  lsp.buffer_autoformat()
  vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)

  lsp.default_keymaps({buffer=bufnr})
end

lsp.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
})

-- lspconfig.ts_ls.setup({})
-- lspconfig.pyright.setup({})
-- lspconfig.gopls.setup{}
-- lspconfig.templ.setup{}
-- lspconfig.angularls.setup{ "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "", "--angularCoreVersion", "" }
-- lspconfig.emmet_language_server.setup{
--     filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact", "templ" }
-- }
-- install all server using mason if lsp is not working

-- autocompletion setup
cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})

lsp.setup()
