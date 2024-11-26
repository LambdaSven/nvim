local M = {}

-- Utility function to find matches in the buffer
local function find_matches(regex)
  local matches = {}
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  for lineno, line in ipairs(lines) do
    local captures = { line:match(regex) }
    if #captures > 0 then
      table.insert(matches, { line = lineno, captures = captures })
    end
  end

  return matches
end

-- Function to display a floating window for selection
local function show_selection(matches, callback)
  local items = {}
  for _, match in ipairs(matches) do
    for _, capture in ipairs(match.captures) do
      table.insert(items, string.format('[%d] %s', match.line, capture))
    end
  end

  vim.ui.select(items, { prompt = 'Select a match:' }, function(choice)
    if not choice then
      print 'No selection made.'
      return
    end

    for _, match in ipairs(matches) do
      for _, capture in ipairs(match.captures) do
        if choice:find(capture, 1, true) then
          callback(capture)
          return
        end
      end
    end
  end)
end

function M.select_and_execute(regex, command)
  if not regex or regex == '' then
    print 'Please provide a valid regex.'
    return
  end

  local matches = find_matches(regex)
  if #matches == 0 then
    print 'No matches found.'
    return
  end

  -- Create a new buffer for the test output
  local output_buf = vim.api.nvim_create_buf(true, true) -- Create a new empty buffer
  vim.api.nvim_buf_set_name(output_buf, 'Test Output') -- Set buffer name to "Test Output"
  vim.api.nvim_command('b ' .. output_buf) -- Switch to the new buffer

  show_selection(matches, function(selected_group)
    local full_command = 'npx playwright test --headed --project=chromium -g ' .. vim.fn.shellescape(selected_group)
    print('Executing: ' .. full_command)

    -- Run the command asynchronously using jobstart
    local _ = vim.fn.jobstart(full_command, {
      stdout_buffered = true, -- Capture stdout in the buffer
      stderr_buffered = true, -- Capture stderr in the buffer
      on_stdout = function(_, data)
        -- Write the output to the new buffer
        if data then
          vim.api.nvim_buf_set_lines(output_buf, -1, -1, false, data)
        end
      end,
      on_stderr = function(_, data)
        -- Write error output to the buffer as well
        if data then
          vim.api.nvim_buf_set_lines(output_buf, -1, -1, false, data)
        end
      end,
      on_exit = function(_, exit_code)
        -- Handle the process exit (e.g., notify user)
        if exit_code == 0 then
          vim.api.nvim_buf_set_lines(output_buf, -1, -1, false, { 'Test run completed successfully' })
        else
          vim.api.nvim_buf_set_lines(output_buf, -1, -1, false, { 'Test run failed with exit code ' .. exit_code })
        end
      end,
    })
  end)
end

-- Command to trigger the plugin
function M.setup()
  vim.api.nvim_create_user_command('SelectAndRun', function(opts)
    local regex = (opts.args ~= '' and opts.args) or "test%('(.*)'" -- Default regex for words
    M.select_and_execute(regex, 'npx playwright test --headed --project=chromium -g ') -- Replace "echo" with your desired command
  end, { nargs = '?' }) -- nargs=1 means the user must provide a regex
end

return M
