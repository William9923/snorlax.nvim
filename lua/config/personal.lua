-- Dicipline: Don't repeat same key too much
local dicipline = require("personal.dicipline")
dicipline.norepeat() -- NOTE: prevent / train vim user to not apply continuous key repeat

-- Keylogger: Showcase the actual key translated into neovim (vs what we type)
local keylogger = require("personal.keylogger")
keylogger.setup()
-- keylogger.toggle() --> TODO: make a better way to activate this, for example can use autocmd

