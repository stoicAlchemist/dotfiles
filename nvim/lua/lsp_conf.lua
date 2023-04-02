-- LSP Configurations
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_opt(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_opt('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_map('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_map('n', '<C-S-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_map('n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_map('n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_map('n', '<space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_map('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_map('n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_map('n', '<space>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_map('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_map("n", "<space>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts) -- Needs async = true somewhere... :shrug:

  -- Lspsaga keybindings
  buf_map("n", "gr", "<cmd>Lspsaga rename<cr>", opts)
  buf_map("n", "gx", "<cmd>Lspsaga code_action<cr>", opts)
  buf_map("x", "gx", ":<c-u>Lspsaga range_code_action<cr>", opts)
  buf_map("n", "K",  "<cmd>Lspsaga hover_doc<cr>", opts)
  buf_map("n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
  buf_map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
  buf_map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers that don't need extra config and
-- map buffer local keybindings when the language server attaches
local servers = {
  "solargraph", -- requires solargraph to be installed as well as rubocop via gem install
  "tsserver" -- requires typescript and typescript-language-server to be installed via npm
}

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities
  }
end

-- Elixir requires specific options

-- Replace the following with the path to your installation
local path_to_elixirls = vim.fn.expand("~/Packages/elixir-ls/release/language_server.sh")

nvim_lsp.elixirls.setup({
  cmd = {path_to_elixirls},
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    elixirLS = {
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = false,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = false
    }
  }
})

return {}
