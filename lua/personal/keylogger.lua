local M = {}
local api = vim.api

-- Configuration options
M.config = {
  clear_after = 5, -- Clear keys after this many seconds
  max_buffer = 50, -- Maximum number of keys to store
  win_opts = {
    relative = "win",
    width = 40,
    height = 1,
    col = vim.o.columns - 1,
    row = vim.o.lines - 1,
    anchor = "SE",
    style = "minimal",
    title = "Keylogger",
    title_pos = "center",
    border = { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" },
  },
  disable = {
    filetypes = {},
    buftypes = {},
  },
}

-- Key representations
M.key_repr = {
  ["<TAB>"] = "󰌒",
  ["<CR>"] = "󰌑",
  ["<ESC>"] = "Esc",
  ["<SPACE>"] = "␣",
  ["<BS>"] = "󰌥",
  ["<DEL>"] = "Del",
  ["<LEFT>"] = "",
  ["<RIGHT>"] = "",
  ["<UP>"] = "",
  ["<DOWN>"] = "",
  ["<HOME>"] = "Home",
  ["<END>"] = "End",
  ["<PAGEUP>"] = "PgUp",
  ["<PAGEDOWN>"] = "PgDn",
  ["<INSERT>"] = "Ins",
  ["<F1>"] = "󱊫",
  ["<F2>"] = "󱊬",
  ["<F3>"] = "󱊭",
  ["<F4>"] = "󱊮",
  ["<F5>"] = "󱊯",
  ["<F6>"] = "󱊰",
  ["<F7>"] = "󱊱",
  ["<F8>"] = "󱊲",
  ["<F9>"] = "󱊳",
  ["<F10>"] = "󱊴",
  ["<F11>"] = "󱊵",
  ["<F12>"] = "󱊶",
  ["CTRL"] = "Ctrl",
  ["ALT"] = "Alt",
  ["SUPER"] = "󰘳",
  ["<leader>"] = "<L>",
}

local active = false
local bufnr, winnr = nil, nil
local ns_id = api.nvim_create_namespace("keylogger")
local queued_keys = {}
local time = 0
local timer = nil

local function create_window()
  if not bufnr or not api.nvim_buf_is_valid(bufnr) then
    bufnr = api.nvim_create_buf(false, true)
  end

  winnr = api.nvim_open_win(bufnr, false, M.config.win_opts)
  if not winnr then
    error("Keylogger: failed to create window")
  end

  api.nvim_set_option_value("filetype", "keylogger", { buf = bufnr })
end

local function close_window()
  if bufnr and api.nvim_buf_is_valid(bufnr) then
    api.nvim_buf_delete(bufnr, { force = true })
  end

  if winnr and api.nvim_win_is_valid(winnr) then
    api.nvim_win_close(winnr, true)
  end

  bufnr, winnr = nil, nil -- reset
end

-- TODO: we need to adjust to instead of clearing whole buffer, only clear buffer after timestamp...
local function clear_buffer()
  if bufnr == nil then
    return
  end

  local rep = {}
  for _ = 1, M.config.win_opts.height do
    table.insert(rep, "")
  end
  api.nvim_buf_set_lines(bufnr, 0, -1, false, rep)
end

local function create_timer()
  timer = vim.uv.new_timer()
  timer:start(
    0,
    1000, -- in ms (1000ms -> 1s)
    vim.schedule_wrap(function()
      time = time + 1 -- TODO: the time shouldn't work this way -> should use actual timestamp for it, and then use comparation to check if a keybind need to be deleted / not
      if time >= M.config.clear_after then
        queued_keys = {}
        if active then
          clear_buffer()
        end
        time = 0
      end
    end)
  )
end

local function kill_timer()
  if not timer then
    error("Keylogger: no timer created")
  end
  timer:stop()
  timer:close()
  timer = nil
end

local function should_disable()
  local filetype = api.nvim_get_option_value("filetype", { buf = 0 })
  if vim.tbl_contains(M.config.disable.filetypes, filetype) then
    return true
  end

  local buftype = api.nvim_get_option_value("buftype", { buf = 0 })
  if vim.tbl_contains(M.config.disable.buftypes, buftype) then
    return true
  end

  return false
end

local function transform_input(key)
  key = vim.fn.keytrans(key)
  local transformed_keys = {}

  -- Split compound keys (e.g., "<C-A>" into ["<C-", "A", ">"])
  local split_keys = vim.split(key, "(<[^>]+>)", true)

  for _, k in ipairs(split_keys) do
    if k ~= "" then
      local transformed_key = M.key_repr[k] or k

      -- Handle special keys like Ctrl, Alt, etc.
      if k:match("^<.*>$") then
        local modifier, key = k:match("^<([^-]+)%-(.+)>$")
        if modifier and key then
          local mod_repr = M.key_repr[modifier:upper()] or modifier
          local key_repr = M.key_repr[key:upper()] or key
          transformed_key = mod_repr .. "+" .. key_repr
        end
      end

      table.insert(transformed_keys, {
        key = transformed_key,
        is_special = k:match("^<.*>$") ~= nil,
      })
    end
  end

  return transformed_keys
end

local function display_text()
  if not active or #queued_keys == 0 or bufnr == nil then
    return
  end

  local display_keys = {}
  local total_width = 0
  local max_width = M.config.win_opts.width - 2 -- Account for borders

  -- Prepare keys for display, respecting max width
  for i = #queued_keys, 1, -1 do
    local key_info = queued_keys[i]
    local key_width = vim.fn.strdisplaywidth(key_info.key)

    if total_width + key_width + 1 > max_width then
      break
    end

    table.insert(display_keys, 1, key_info.key)
    total_width = total_width + key_width + 1 -- +1 for space
  end

  -- Join keys and center the text
  local text = table.concat(display_keys, " ")
  local padding = string.rep(" ", math.floor((max_width - total_width) / 2))
  local centered_text = padding .. text

  -- Set the text in the buffer
  local line = math.floor(M.config.win_opts.height / 2)
  api.nvim_buf_set_lines(bufnr, line, line + 1, false, { centered_text })

  -- Apply highlighting for special keys
  api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
  local col_start = #padding
  for _, key_info in ipairs(display_keys) do
    if key_info.is_special then
      local col_end = col_start + vim.fn.strdisplaywidth(key_info.key)
      api.nvim_buf_add_highlight(bufnr, ns_id, "SpecialKey", line, col_start, col_end)
    end
    col_start = col_start + vim.fn.strdisplaywidth(key_info.key) + 1 -- +1 for space
  end
end

local function slice(tbl, first, last, step)
  local sliced = {}

  for i = first or 1, last or #tbl, step or 1 do
    sliced[#sliced + 1] = tbl[i]
  end

  return sliced
end

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
  vim.on_key(function(key)
    if not active or should_disable() then
      return
    end

    -- Probably shouldn't create the time here, instead just check if the timer there or not
    -- TODO: on toggle -> you can activate it probably...
    if not timer then
      create_timer()
    end

    -- TODO: transform_input -> need to adjust even further...
    local transformed_keys = transform_input(key)
    for _, k in ipairs(transformed_keys) do
      table.insert(queued_keys, k)
    end

    if #queued_keys > M.config.max_buffer then
      queued_keys = slice(queued_keys, 0, M.config.max_buffer - 1)
    end

    display_text()
  end, ns_id)
end

function M.toggle()
  active = not active
  queued_keys = {}
  if active then
    create_window()
  else
    close_window()
    kill_timer()
  end
end

return M
