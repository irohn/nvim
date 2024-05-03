-- Operating system
if vim.fn.has("linux") == 1 then
  local get_os_value = function(regex)
    return string.gsub(vim.system({
      "grep",
      "-oP",
      "(?<=^" .. regex .. "=).*",
      "/etc/os-release"
    }):wait()["stdout"], "%s+", "")
  end
  vim.g.osinfo = {
    type = "linux",
    id = get_os_value("ID"),
    name = get_os_value("NAME"),
    pretty_name = get_os_value("PRETTY_NAME"),
    version = get_os_value("VERSION_ID"),
    codename = get_os_value("VERSION_CODENAME"),
  }
elseif vim.fn.has("mac") == 1 then
  local get_os_value = function(opt)
    return string.gsub(vim.system({
      "sw_vers",
      "-" .. opt,
    }):wait()["stdout"], "%s+", "")
  end
  vim.g.osinfo = {
    type = "darwin",
    id = "macos",
    name = get_os_value("productName"),
    pretty_name = get_os_value("productName"),
    version = get_os_value("productVersion"),
    codename = get_os_value("productVersion"),
  }
elseif vim.fn.has("win32") == 1 then
  vim.g.osinfo = {
    type = "windows",
    id = "windows",
    name = "windows",
    pretty_name = "Windows",
    version = "unknown",
    codename = "unknown",
  }
else
  vim.g.osinfo = {
    type = "unknown",
    id = "unknown",
    name = "unknown",
    pretty_name = "unknown",
    version = "unknown",
    codename = "unknown",
  }
end

