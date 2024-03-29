local lsp = require'lspconfig'
local lsp_mappings = require'dkg.mappings'.lsp_mappings

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
-- if ok then
--   capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
-- end

local on_attach = function(client, bufnr)
  lsp_mappings(bufnr)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
  vim.cmd [[ command! -buffer -nargs=? ReplaceAll lua vim.lsp.buf.rename(<args>)<CR> ]]
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end


local servers = {
  clangd = {
    cmd = {
      '/opt/homebrew/Cellar/llvm/17.0.6_1/bin/clangd',
      '--background-index',
      '--clang-tidy',
      '--offset-encoding=utf-16',
    },
    filetypes = {'c', 'cpp'},
  },
  cmake = {},
  tsserver = {},
  gdscript = {},
  jsonls = {},
  zls = {
    cmd = {
      'zls',
      '--config-path',
      vim.fn.expand('~/.dotfiles/config/zls/zls.json'),
    }
  },
  -- supercollider = {},
  -- sumneko_lua = {
  --   cmd = { '/opt/homebrew/Cellar/lua-language-server/3.6.8/bin/lua-language-server' },
  --   settings = {
  --     Lua = {
  --       runtime = {
  --         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
  --         version = 'LuaJIT',
  --       },
  --       diagnostics = {
  --         -- Get the language server to recognize the `vim` global
  --         globals = {'vim'},
  --       },
  --       -- workspace = {
  --       --   -- Make the server aware of Neovim runtime files
  --       --   library = vim.api.nvim_get_runtime_file("", true),
  --       --   checkThirdParty = false,
  --       -- },
  --       -- Do not send telemetry data containing a randomized but unique identifier
  --       telemetry = {
  --         enable = false,
  --       },
  --     },
  --   },
  -- }
}

-- local configs = require'lspconfig.configs'
-- if not configs.supercollider then
--   configs.supercollider = {
--     default_config = {
--       cmd = {
--         '/Users/dkg/code/javascript/sclang-lsp-stdio/sclang-lsp-stdio.mjs',
--         '/Applications/SuperCollider.app/Contents/MacOS/sclang',
--         '-d',
--         '/tmp/sclang-lsp.txt'
--       },
--       filetypes = {'supercollider'},
--       root_dir = function(fname)
--         return vim.fn.getcwd()
--       end,
--     },
--     settings = {},
--   }
-- end

-- vim.lsp.set_log_level(vim.lsp.log_levels.DEBUG)
-- servers['supercollider'] = configs.supercollider

for name, cfg in pairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  config = vim.tbl_extend('keep', config, cfg)
  lsp[name].setup(config)
end
