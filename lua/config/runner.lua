-- Quick compile-and-run for the current file, in a floating terminal.
local run_term_win = nil
local run_term_buf = nil

local function RunProgram()
  vim.cmd("write")

  local ft = vim.bo.filetype
  local file = vim.fn.expand("%")
  local output = vim.fn.expand("%:r")
  local cmd

  if ft == "c" then
    cmd = string.format("gcc '%s' -o '%s' && './%s'", file, output, output)
  elseif ft == "python" then
    cmd = string.format("python3 '%s'", file)
  elseif ft == "rust" then
    if vim.fn.filereadable("Cargo.toml") == 1 then
      cmd = "cargo run"
    else
      cmd = string.format("rustc '%s' -o '%s' && './%s'", file, output, output)
    end
  else
    vim.notify("Unsupported filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  if run_term_win and vim.api.nvim_win_is_valid(run_term_win) then
    vim.api.nvim_set_current_win(run_term_win)
    vim.cmd("terminal " .. cmd)
    return
  end

  run_term_buf = vim.api.nvim_create_buf(false, true)

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  run_term_win = vim.api.nvim_open_win(run_term_buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  vim.api.nvim_set_current_buf(run_term_buf)
  vim.cmd("terminal " .. cmd)

  local function close_term()
    if run_term_win and vim.api.nvim_win_is_valid(run_term_win) then
      vim.api.nvim_win_close(run_term_win, true)
    end
    if run_term_buf and vim.api.nvim_buf_is_valid(run_term_buf) then
      vim.api.nvim_buf_delete(run_term_buf, { force = true })
    end
    run_term_win = nil
    run_term_buf = nil
  end

  vim.keymap.set("t", "<Esc>", close_term, { buffer = run_term_buf })
  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = run_term_buf,
    once = true,
    callback = close_term,
  })
end

vim.keymap.set("n", "<C-A-n>", RunProgram, {
  noremap = true,
  silent = true,
  desc = "Run current program",
})
