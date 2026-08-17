require("mason").setup()
require("mason-lspconfig").setup()
local cmp = require("cmp")

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)

    local opts = { buffer = args.buf }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({async = true}) end, opts)
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)

    -- Enable inlay hints if supported
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client:supports_method("textDocument/inlayHint") then
        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end

    if client and client:supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format({
                    bufnr = args.buf,
                    async = false,
                })
            end,
        })
    end

    end
})

-- vim.lsp.config("angularls", {
--     "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "", "--angularCoreVersion", "" 
-- })
--
-- vim.lsp.config("emmet_language_server", {
--     filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact", "templ" }
-- })

vim.lsp.config('apex_ls', {
 apex_jar_path = vim.fn.stdpath('data') .. '/mason/share/apex-language-server/apex-jorje-lsp.jar',
})

vim.filetype.add({
  extension = {
    cls = "apex",
    trigger = "apex",
  },
})


vim.lsp.enable("ts_ls")
vim.lsp.enable("apex_ls")
-- vim.lsp.enable("pyright")
-- vim.lsp.enable("gopls")
-- vim.lsp.enable("templ")
-- vim.lsp.enable("angularls")
-- vim.lsp.enable("emmet_language_server")

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

