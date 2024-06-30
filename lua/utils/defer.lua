---@class utils.defer
local M = {}

---@see From https://gist.github.com/runiq/31aa5c4bf00f8e0843cd267880117201

--- Debounces a function on the leading edge.
---
---@param fn function Function to debounce
---@param delay number Delay in ms
---@return function # Wrapped fn
function M.debounce(fn, delay)
  local timer = vim.loop.new_timer()
  local running = false

  return function(...)
    timer:start(delay, 0, function()
      running = false
    end)

    if not running then
      running = true
      pcall(vim.schedule_wrap(fn), select(1, ...))
    end
  end
end

--- Throttles a function on the leading edge.
---
---@param fn function Function to throttle
---@param delay number Delay in ms
---@return function # Wrapped fn
function M.throttle(fn, delay)
  local timer = vim.loop.new_timer()
  local running = false

  return function(...)
    if not running then
      timer:start(delay, 0, function()
        running = false
      end)
      running = true
      pcall(vim.schedule_wrap(fn), select(1, ...))
    end
  end
end

return M
