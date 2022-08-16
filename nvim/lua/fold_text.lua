local fn = vim.fn
local v = vim.v
local o = vim.o
local call = vim.call

local function foldtext()
  line = fn.getline(v.foldstart)
  folded_line_num = v.foldend - v.foldstart
  line_text = fn.substitute(line, '^"{+', '', 'g')
  -- Number 5 is just a random number to space the right side
  fillcharcount = o.textwidth - string.len(line_text) - string.len(folded_line_num) - 5
  -- Repeat function in vim can't be called via vim.fn.repeat, repeat is a reserved word
  filling_string = call("repeat", ".", fillcharcount)
  return line_text .. filling_string .. " (" .. folded_line_num .. " L)"
end

local M = {
  my_foldtext = function() return foldtext() end
}

return M
