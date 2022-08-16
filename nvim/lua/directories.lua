local call = vim.call
local fn = vim.fn
local o = vim.o

local backupdir = vim.env.HOME.."/.config/nvim/temp/backup/"
local viewdir = vim.env.HOME.."/.config/nvim/temp/viewdir/"
local undodir = vim.env.HOME.."/.config/nvim/temp/undodir/"

-- The VIM function "isdirectory" returns 0 or 1 instead of boolean values
if fn.isdirectory(fn.expand(backupdir)) == 0 then
  call("mkdir", fn.expand(backupdir), "p")
end
if fn.isdirectory(fn.expand(viewdir)) == 0 then
  call("mkdir", fn.expand(viewdir), "p")
end
if fn.isdirectory(fn.expand(undodir)) == 0 then
  call("mkdir", fn.expand(undodir), "p")
end

o.backupdir = backupdir
o.viewdir = viewdir
o.undodir = undodir
