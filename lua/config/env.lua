local secrets_dir = "/run/agenix"

local function read_file(filepath)
  local file = io.open(filepath, "r") -- Open file in read mode
  if not file then
    vim.notify("Failed to open file: " .. filepath, vim.log.levels.ERROR)
    return nil
  end

  local content = file:read("*a") -- Read the entire file as a string
  file:close()
  return vim.trim(content) -- Remove leading/trailing whitespace
end

local anthropic_api_key = read_file(secrets_dir .. "/anthropics_api_key")
if anthropic_api_key then
  vim.env.ANTHROPIC_API_KEY = anthropic_api_key
end

local openai_api_key = read_file(secrets_dir .. "/openai_api_key")
if openai_api_key then
  vim.env.OPENAI_API_KEY = openai_api_key
end

-- vim: ts=2 sts=2 sw=2 et
