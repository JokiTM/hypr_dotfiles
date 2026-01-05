-- Arduino helper: manual compile/upload via keymap + monitor on success
local M = {}
M.monitor_job = nil
M.monitor_buf = nil
M.monitor_win = nil

local function filter_lines(data)
  if not data then return {} end
  local out = {}
  for _, line in ipairs(data) do
    if line ~= vim.NIL and line ~= "" then
      table.insert(out, line)
    end
  end
  return out
end

local function open_floating_buf(lines, opts)
  opts = opts or {}
  local width = math.floor(vim.o.columns * (opts.width or 0.8))
  local height = math.floor(vim.o.lines * (opts.height or 0.6))
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true) -- scratch, unlisted
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  if lines and #lines > 0 then
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  end

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  -- convenient keymaps for that window/buffer
  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<cr>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "<cmd>close<cr>", { noremap = true, silent = true })

  return buf, win
end


local function start_monitor(file_dir)
  if M.monitor_job and vim.fn.jobwait({M.monitor_job}, 0)[1] == -1 then
    require("notify")("Monitor läuft bereits", "info", { title = "Arduino" })
    return
  end

  local cmd = "cd " .. vim.fn.shellescape(file_dir)
            .. " && arduino-cli monitor --port $(arduino-cli board list | grep USB | awk '{ print $1 }')"

  local buf, win = open_floating_buf({ "Starting monitor..." }, { width = 0.8, height = 0.6 })
  M.monitor_buf = buf
  M.monitor_win = win

  M.monitor_job = vim.fn.jobstart(cmd, {
    stdout_buffered = false,
    stderr_buffered = false,
    on_stdout = function(_, data, _)
      local lines = filter_lines(data)
      if #lines > 0 and vim.api.nvim_buf_is_valid(M.monitor_buf) then
        local cur_lines = vim.api.nvim_buf_line_count(M.monitor_buf)
        vim.api.nvim_buf_set_lines(M.monitor_buf, cur_lines, cur_lines, false, lines)
      end
    end,
    on_stderr = function(_, data, _)
      local lines = filter_lines(data)
      if #lines > 0 and vim.api.nvim_buf_is_valid(M.monitor_buf) then
        local cur_lines = vim.api.nvim_buf_line_count(M.monitor_buf)
        vim.api.nvim_buf_set_lines(M.monitor_buf, cur_lines, cur_lines, false, lines)
      end
    end,
    on_exit = function()
      vim.schedule(function()
        M.monitor_job = nil
      end)
    end,
  })

  -- Stoppe den Job, wenn der Buffer geschlossen wird, aber NICHT den Buffer löschen
  vim.api.nvim_create_autocmd("BufWipeout", {
    buffer = buf,
    callback = function()
      if M.monitor_job and vim.fn.jobwait({M.monitor_job}, 0)[1] == -1 then
        pcall(vim.fn.jobstop, M.monitor_job)
        M.monitor_job = nil
      end
      M.monitor_buf = nil
      M.monitor_win = nil
      require("notify")("Monitor gestoppt (Buffer geschlossen)", "info", { title = "Arduino Monitor" })
    end,
    once = true,
  })

  require("notify")("Monitor gestartet", "info", { title = "Arduino Monitor" })
end
local function stop_monitor()
  if M.monitor_job and vim.fn.jobwait({M.monitor_job}, 0)[1] == -1 then
    pcall(vim.fn.jobstop, M.monitor_job)
    M.monitor_job = nil
  end
  if M.monitor_win and vim.api.nvim_win_is_valid(M.monitor_win) then
    pcall(vim.api.nvim_win_close, M.monitor_win, true)
  end
  if M.monitor_buf and vim.api.nvim_buf_is_valid(M.monitor_buf) then
    pcall(vim.api.nvim_buf_delete, M.monitor_buf, { force = true })
  end
  M.monitor_buf = nil
  M.monitor_win = nil
  require("notify")("Monitor gestoppt", "info", { title = "Arduino Monitor" })
end

local function show_compile_logs(output, err)
  local lines = {}
  if output and #output > 0 then
    vim.list_extend(lines, output)
  end
  if err and #err > 0 then
    if #lines > 0 then table.insert(lines, "") end
    table.insert(lines, "=== STDERR ===")
    vim.list_extend(lines, err)
  end
  open_floating_buf(lines, { width = 0.85, height = 0.7 })
end

local function upload_current_file()
  local output = {}
  local err = {}

  local file_dir = vim.fn.expand("%:p:h")
  if file_dir == "" or file_dir == nil then
    require("notify")("Kein Dateipfad gefunden", "error", { title = "Arduino" })
    return
  end

  local cmd = "cd " .. vim.fn.shellescape(file_dir)
            .. " && arduino-cli compile --fqbn arduino:avr:micro --port $(arduino-cli board list | grep USB | awk '{ print $1 }') --upload"

  vim.fn.jobstart(cmd, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data, _)
      if data then vim.list_extend(output, filter_lines(data)) end
    end,
    on_stderr = function(_, data, _)
      if data then vim.list_extend(err, filter_lines(data)) end
    end,
    on_exit = function(_, exit_code, _)
      vim.schedule(function()
        if exit_code == 0 then
          require("notify")("Sketch hochgeladen ✔️", "info", { title = "Arduino" })
          -- start monitor streaming into a floating window
          start_monitor(file_dir)
        else
          require("notify")("Fehler beim Hochladen ❌", "error", { title = "Arduino" })
          -- show compile/upload logs in floating window
          show_compile_logs(output, err)
        end
      end)
    end,
  })
end

-- removed BufWritePost autocmd: compile/upload only via keymap now

-- keymaps
-- <leader>a => start upload/compile manually
vim.keymap.set("n", "<leader>ac", function() upload_current_file() end, {
  noremap = true,
  silent = true,
  desc = "Arduino: compile & upload (start monitor on success)",
})

-- <leader><Space>m => stop monitor
vim.keymap.set("n", "<leader>as", function() stop_monitor() end, {
  noremap = true,
  silent = true,
  desc = "Arduino: stop monitor",
})

M.start_monitor = start_monitor
M.stop_monitor = stop_monitor
M.upload_current_file = upload_current_file

return M
