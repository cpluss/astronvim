-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local astro_utils = require "astronvim.utils"
return {
  -- first key is the mode
  n = {
    -- better buffer navigation
    ["]t"] = false,
    ["[t"] = false,
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    -- buffer switching
    ["<Tab>"] = {
      function()
        if #vim.t.bufs > 1 then
          require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
        else
          astro_utils.notify "No other buffers open"
        end
      end,
      desc = "Switch Buffers",
    },
    ["<C-S-g>"] = {
      function() 
        require("gitlinker").get_buf_range_url("n", {action_callback = require("gitlinker.actions").open_in_browser}, {silent = true})
      end,
      desc = "Open current line in git remote"
    },
  },
  v = {
    ["<C-S-g>"] = {
      function() 
        require("gitlinker").get_buf_range_url("v", {action_callback = require("gitlinker.actions").open_in_browser}, {})
      end,
      desc = "Open current line in git remote"
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
