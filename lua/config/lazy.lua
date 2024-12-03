-- Bootstrap lazy.nvim
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

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"
-- disable/enable extra plugins with user commands ExtraPluginsDisable / ExtraPluginsEnable
vim.g.extra_plugins = require("config.utils").extra()


-- Setup lazy.nvim
require("lazy").setup({ spec = {
  { import = "plugins/core" },
  vim.g.extra_plugins and { import = "plugins/extra" } or nil,
}}, {
  ui = { border = 'rounded' },
  -- Don't bother me when tweaking plugins.
  change_detection = { notify = false },
  -- None of my plugins use luarocks so disable this.
  rocks = { enabled = false },
  performance = {
    rtp = {
      -- Stuff I don't use.
      disabled_plugins = {
        'gzip',
        'netrwPlugin',
        'rplugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
