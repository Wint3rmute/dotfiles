--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth                                          = 2
vim.opt.tabstop                                             = 2
vim.opt.relativenumber                                      = true

-- general
lvim.log.level                                              = "info"
lvim.format_on_save                                         = {
  enabled = false,
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader                                                 = "space"
-- add your own keymapping
lvim.keys.normal_mode["<S-l>"]                              = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"]                              = ":BufferLineCyclePrev<CR>"
lvim.builtin.which_key.mappings["t"]                        = { "<cmd>TroubleToggle<cr>", "Tougle Trouble list" }
lvim.builtin.which_key.mappings["P"]                        = { "<cmd>Telescope projects<cr>", "Switch project" }

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active                                   = true
lvim.builtin.alpha.mode                                     = "dashboard"

lvim.builtin.terminal.active                                = true
lvim.builtin.terminal.open_mapping                          = "<c-t>"

lvim.builtin.nvimtree.setup.view.side                       = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git         = false
lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install                        = true

function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pylyzer" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters, formatters and code actions <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }
-- local code_actions = require "lvim.lsp.null-ls.code_actions"
-- code_actions.setup {
--   {
--     exe = "eslint",
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

lvim.plugins = {
  { "marko-cerovac/material.nvim" },
  -- { "norcalli/nvim-colorizer.lua" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "rhysd/conflict-marker.vim" },
  { "mfussenegger/nvim-dap" }
}

require('material').setup({
  disable = {
    background = true
  },
  async_loading = false, -- Load parts of the theme asyncronously for faster startup (turned on by default)
})

local dap = require('dap')
dap.adapters.c = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

-- dap.configurations.c = {
--   {
--     name = 'Launch',
--     type = 'lldb',
--     request = 'launch',
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--     args = {},
--   },
--   {
--     -- If you get an "Operation not permitted" error using this, try disabling YAMA:
--     --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
--     name = "Attach to process",
--     -- type = 'cpp',  -- Adjust this to match your adapter name (`dap.adapters.<name>`)
--     request = 'attach',
--     pid = require('dap.utils').pick_process,
--     args = {},
--   },
-- }

lvim.colorscheme = "material"

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
