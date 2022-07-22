import "cjson"
function settings_decode(settings)
  path = "/sdcard/devToolbox/config.cfg"
  value = 文件是否存在(path,value)
  if value == false then
    write(path,"{}")
  end
  file = io.open(path,"r")
  settings = cjson.decode(file:read("*a"))
  file:close()
  return settings
end
function settings_encode(settings)
  path = "/sdcard/devToolbox/config.cfg"
  value = 文件是否存在(path,value)
  if value == false then
    write(path,"{}")
  end
  settings_json = cjson.encode(settings)
  file = io.open(path,"w")
  file:write(settings_json)
  file:close()
end

