return {
  "echasnovski/mini.surround",
  config = function()
    require('mini.surround').setup({
      mappings = {
        add = 'gsa',       -- Add surrounding in Normal and Visual modes
        delete = 'gsd',    -- Delete surrounding
        find = 'gsf',      -- Find surrounding (to the right)
        find_left = 'gsF', -- Find surrounding (to the left)
        highlight = 'gsh', -- Highlight surrounding
        replace = 'gsr',   -- Replace surrounding
      }
    })
  end
}
