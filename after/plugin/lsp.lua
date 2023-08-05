local on_attach = function(_, bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


-- mason
require("mason").setup()
require("mason-lspconfig").setup_handlers({

    function(server_name)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end,

    ["lua_ls"] = function()
        require('neodev').setup()
        require('lspconfig').lua_ls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
        }
    end

    -- another example
    -- ["omnisharp"] = function()
    --     require('lspconfig').omnisharp.setup {
    --         filetypes = { "cs", "vb" },
    --         root_dir = require('lspconfig').util.root_pattern("*.csproj", "*.sln"),
    --         on_attach = on_attach,
    --         capabilities = capabilities,
    --         enable_roslyn_analyzers = true,
    --         analyze_open_documents_only = true,
    --         enable_import_completion = true,
    --     }
    -- end,
})
