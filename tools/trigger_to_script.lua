require "import"
import "theme"
import "mengchen"
import "settings"

activity.setContentView("tools/trigger_to_script_layout")
settings = settings_decode()

if settings.software_mode == 1 then
  path = "/sdcard/Android/data/"..settings.miniworld_package_name.."/files/miniplay/data/"
 elseif settings.software_mode == 2 then
  path = "/sdcard/miniplay/"..settings.miniworld_package_name.."/data/"
 elseif settings.software_mode == 3 then
  path = "/data/data/"..settings.miniworld_package_name.."/files/miniplay/data/"
end

import 'data'

if not data.check()--检查data权限
  data.request(data.save)--请求data权限，回调保存data权限
  print("下次执行生效")
  return
end

function choose.onClick()
  activity.newActivity("mods/map_chooser")
end

function choose_type_1.onClick()
  if map ~= nil then
    activity.newActivity("mods/file_chooser",{path..map[2].."/ss/trigger/game_type_1/",1})
   else
    msg"请先选择地图"
  end
end

function choose_type_2.onClick()
  if map ~= nil then
    activity.newActivity("mods/file_chooser",{path..map[2].."/ss/trigger/game_type_2/",2})
   else
    msg"请先选择地图"
  end
end

function convert2script.onClick()
  if map == nil then
    msg"请选择地图"
   elseif script == nil then
    msg"请选择脚本"
   elseif trigger == nil then
    msg"请选择触发器"
   else
    io.open(script[1],"w"):write(io.open(trigger[1]):read("*a")):close()
    msg"触发器转脚本成功"
  end
end

function convert2trigger.onClick()
  if map == nil then
    msg"请选择地图"
   elseif script == nil then
    msg"请选择脚本"
   elseif trigger == nil then
    msg"请选择触发器"
   else
    io.open(trigger[1],"w"):write(io.open(script[1]):read("*a")):close()
    msg"脚本转触发器成功"
  end
end

function onResult(name,result)
  if name == "mods/map_chooser" then
    trigger = nil
    script = nil
    type_1.Text = "请选择脚本"
    type_2.Text = "请选择触发器"
    map = result
    LuaUtil.copyDir(map[1],"/sdcard/devToolbox/thumb.png")
    map_thumb.setImageBitmap(loadbitmap("/sdcard/devToolbox/thumb.png"))
    map_name.Text = map[2]
   elseif name == "mods/file_chooser" then
    if result[3] == 1 then
      script = result
      type_1.Text = script[2]
     elseif result[3] == 2 then
      trigger = result
      type_2.Text = trigger[2]
    end
  end
end

