do

-- Returns true if is not empty
local function has_usage_data(dict)
  if (dict.usage == nil or dict.usage == '') then
    return false
  end
  return true
end

-- Get commands for that plugin
local function plugin_help(name)
  local plugin = plugins[name]
  if not plugin then return nil end

  local text = ""
  if (type(plugin.usage) == "table") then
    for ku,usage in pairs(plugin.usage) do
      text = text..usage..'\n'
    end
    text = text..'\n'
  elseif has_usage_data(plugin) then -- Is not empty
    text = text..plugin.usage..'\n\n'
  end
  return text
end

-- !help command
local function telegram_help()
  local text = "Plugin list: \n\n"
  -- Plugins names
  for name in pairs(plugins) do
    text = text..name..'\n'
  end
  text = text..'\n'..'Write "!help [plugin name]" for more info.'
  text = text..'\n'..'Or "!help all" to show all info.'
  return text
end

-- !help all command
local function help_all()
  local ret = ""
  for name in pairs(plugins) do
    ret = ret .. plugin_help(name)
  end
  return ret
end

local function run(msg, matches)
  if matches[1] == "!help" then
    local text = tostring(_config.help_text_plugins)
    return telegram_help()
  elseif matches[1] == "!help all" then
    local text = tostring(_config.help_text_alldashit)
    return text
  elseif matches[1] == "!help super" then
    local text = tostring(_config.help_text_alldashit)
    return text
  elseif matches[1] == "!help anti-bot" then
    local text = tostring(_config.help_text_anti_bot)
    return text
  elseif matches[1] == "!help banhammer" then
    local text = tostring(_config.help_text_banhammer)
    return text
  elseif matches[1] == "!help help" then
    local text = tostring(_config.help_text_help)
    return text
  elseif matches[1] == "!help NSFW" then
    local text = tostring(_config.help_text_nsfw)
    return text
  elseif matches[1] == "!help get/save" then
    local text = tostring(_config.help_text_get_set)
    return text
  elseif matches[1] == "!help invite" then
    local text = tostring(_config.help_text_invite)
    return text
  elseif matches[1] == "!help lock" then
    local text = tostring(_config.help_text_lock)
    return text
  elseif matches[1] == "!help mute" then
    local text = tostring(_config.help_text_mute)
    return text
  elseif matches[1] == "!help stats" then
    local text = tostring(_config.help_text_stats)
    return text
  elseif matches[1] == "!help time" then
    local text = tostring(_config.help_text_time)
    return text
  elseif matches[1] == "!help vote" then
    local text = tostring(_config.help_text_vote)
    return text
  elseif matches[1] == "!help whitelist" then
    local text = tostring(_config.help_text_whitelist)
    return text
  elseif matches[1] == "!help tweet" then
    local text = tostring(_config.help_text_tweet)
    return text
  elseif matches[1] == "!help read" then
    local text = tostring(_config.help_text_read)
    return text
  elseif matches[1] == "!help flood" then
    local text = tostring(_config.help_text_flood)
    return text
  else 
    local text = plugin_help(matches[1])
    if not text then
      text = telegram_help()
    end
    return text
  end
end

return {
  description = "Help plugin. Get info from other plugins.  ", 
  usage = {
    "!help: Show list of plugins.",
    "!help all: Show all commands for every plugin.",
    "!help [plugin name]: Commands for that plugin."
  },
  patterns = {
    "^!help$",
    "^!help all",
    "^!help super",
    "^!help anti-bot",
    "^!help banhammer",
    "^!help flood",
    "^!help get/save",
    "^!help help",
    "^!help invite",
    "^!help lock",
    "^!help mute",
    "^!help NSFW",
    "^!help plugins",
    "^!help read",
    "^!help stats",
    "^!help time",
    "^!help tweet",
    "^!help vote",
    "^!help whitelist",
    "^!help (.+)"
  }, 
  run = run 
}

end
