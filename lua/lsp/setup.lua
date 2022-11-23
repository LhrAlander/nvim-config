local status, lsp_config = pcall(require, 'lspconfig')
if not status then
  vim.notify('似乎没有安装 nvim-lsp-installer')
  return
end


local on_attach = function(client, bufnr)
   -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local map_fn = function(a1, a2, a3)
    vim.keymap.set(a1, a2, a3, bufopts)
  end
  require('keybindings').map_lsp(map_fn)
end

local lsp_flags = {
  debounce_text_change = 150
}

require('lspconfig')['tsserver'].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  filetypes = {"typescriptreact", "typescript"}
})


local runtime_path = vim.split(package.path, ';')
require('lspconfig')['sumneko_lua'].setup({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    flags = lsp_flags,
    on_attach = on_attach,
})


