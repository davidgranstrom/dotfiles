--- Generate an insert a UUID at the cursor position
local function uuid()
  local ok, res = pcall(vim.fn.system, 'uuidgen')
  if ok then
    res = res:gsub('[\n\r]', '')
    return res:lower()
  end
  return ''
end

return function()
  local keys = 'a' .. uuid() .. '<esc>'
  vim.api.nvim_input(keys)
end
