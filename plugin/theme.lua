local M = {}

local colorscheme_overwrite = nil

local defaults = {
  preview = true,
  keys = "<leader>th",
}

local builtin = require("telescope.builtin")
vim.opt.termguicolors = true

function M.save_colorscheme(color_name)
  local cache_dir = vim.fn.stdpath('cache')
  local file = io.open(cache_dir .. '/colorscheme.txt', 'w')
  if file then
    file:write(color_name)
    file:close()
  end
end

function M.load_cached_colorscheme()
  local cache_dir = vim.fn.stdpath('cache')
  local file = io.open(cache_dir .. '/colorscheme.txt', 'r')
  if file then
    local color_name = file:read()
    file:close()
    -- Safely try to set the colorscheme
    local status_ok = pcall(vim.cmd.colorscheme, color_name)
    if not status_ok then
      vim.notify('Failed to load colorscheme: ' .. color_name, vim.log.levels.WARN)
    end
  end
end


M.setup = function(opts)
  opts = vim.tbl_deep_extend("force", defaults, opts or {})

  vim.keymap.set("n", opts.keys, function()
    local current_buf = vim.api.nvim_get_current_buf()

    builtin.colorscheme({
      attach_mappings = function(_, map)
        map('i', '<CR>', function(prompt_bufnr)
          local selection = require('telescope.actions.state').get_selected_entry()
          require('telescope.actions').close(prompt_bufnr)
          vim.cmd.colorscheme(selection.value)
          M.save_colorscheme(selection.value)
        end)
        return true
      end,
      preview = {
        buffer_previewer_maker = function()
          return current_buf
        end
      },
      previewer = true,
      enable_preview = opts.preview
    })
  end, { silent = true, desc = "Colorscheme picker" })

  if colorscheme_overwrite then
    vim.cmd.colorscheme(colorscheme_overwrite)
  else
    M.load_cached_colorscheme()
  end
end

M.setup()
return M

-- vim: ts=2 sts=2 sw=2 et
