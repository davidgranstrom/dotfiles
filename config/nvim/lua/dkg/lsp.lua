local lsp = require'lspconfig'
local lsp_mappings = require'dkg.mappings'.lsp_mappings

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
-- if ok then
--   capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
-- end

-- vim.lsp.set_log_level(vim.lsp.log_levels.DEBUG)

local on_attach = function(_, bufnr)
  lsp_mappings(bufnr)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
  vim.cmd [[ command! -buffer -nargs=? ReplaceAll lua vim.lsp.buf.rename(<args>)<CR> ]]
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local servers = {
  clangd = {
    cmd = {
      '/opt/homebrew/Cellar/llvm/13.0.1_1/bin/clangd',
      '--background-index',
      '--clang-tidy',
    },
    filetypes = {'c', 'cpp'},
  },
  cmake = {},
  tsserver = {},
  supercollider = {},
}

local configs = require'lspconfig.configs'
if not configs.supercollider then
  configs.supercollider = {
    default_config = {
      cmd = {
        '/Users/dkg/code/javascript/sclang-lsp-stdio/sclang-lsp-stdio.mjs',
        '/Applications/SuperCollider.app/Contents/MacOS/sclang',
        '-d',
        '/tmp/sclang-lsp.txt'
      },
      filetypes = {'supercollider'},
      root_dir = function(fname)
        return vim.fn.getcwd()
      end,
    },
    settings = {},
  }
end

servers['supercollider'] = configs.supercollider

for name, cfg in pairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  config = vim.tbl_extend('keep', config, cfg)
  lsp[name].setup(config)
end
