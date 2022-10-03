import "cjson"
function settings_decode(settings)
  if 文件是否存在("/sdcard") == true then
    path = "/sdcard/devToolbox/config.cfg"
    value = 文件是否存在(path,value)
    if value == false then
      write(path,"{}")
    end
    file = io.open(path,"r")
    settings = cjson.decode(file:read("*a"))
    file:close()
    return settings
   else
    msg"请在手机设置中授予储存权限"
  end
end
function settings_encode(settings)
  if 文件是否存在("/sdcard") == true then
    path = "/sdcard/devToolbox/config.cfg"
    value = 文件是否存在(path,value)
    if value == false then
      write(path,"{}")
    end
    settings_json = cjson.encode(settings)
    file = io.open(path,"w")
    file:write(settings_json)
    file:close()
   else
    msg"请在手机设置中授予储存权限"
  end
end

