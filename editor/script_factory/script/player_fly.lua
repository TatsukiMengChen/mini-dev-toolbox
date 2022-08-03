require "import"
import "theme"
import "mengchen"
import "android.content.Context"
import "editor/script_factory/script/add_item_layout"
activity.setContentView(loadlayout("editor/script_factory/script/player_fly_layout"))
editor_theme(editor)
editor.Text=[===[
--[[
点击生成脚本后脚本会在此显示，可自行修改后再点击复制脚本
关于白名单：
开启：仅拥有白名单的玩家可以飞行
关闭：任何玩家都可以飞行
使用方式：
电脑端双击空格开启飞行模式
手机端双击跳跃键开启飞行模式
--]]
]===]
白名单.ThumbDrawable.setColorFilter(PorterDuffColorFilter(0xFF64B5F6,PorterDuff.Mode.SRC_ATOP))
白名单.TrackDrawable.setColorFilter(PorterDuffColorFilter(0xFF2196F3,PorterDuff.Mode.SRC_ATOP))
function create.onClick()
  print(白名单.checked)
  if 白名单.checked == false then
    script = [[
--双击跳跃键以开启飞行模式
player_fly_key = {}
function player_fly(e)
  if e.vkey == "SPACE" then
    if player_fly_key[e.eventobjid] ~= true then
      player_fly_key[e.eventobjid] = true
      Trigger:wait(0.5)
      player_fly_key[e.eventobjid] = false
     else
      player_fly_key[e.eventobjid] = false
      Player:changPlayerMoveType(e.eventobjid,1)
    end
  end
end
ScriptSupportEvent:registerEvent([=[Player.InputKeyDown]=],player_fly)
]]
    editor.Text = script
   else
    editor.Text = ('white_list = {"'..string.gsub(迷你号.Text,'\n','","')..'"}\n')
    script = [[
--双击跳跃键以开启飞行模式
player_fly_key = {}
function player_fly(e)
  for i = 1,#white_list do
    if tostring(e.eventobjid) == white_list[i] then
      if e.vkey == "SPACE" then
        if player_fly_key[e.eventobjid] ~= true then
          player_fly_key[e.eventobjid] = true
          Trigger:wait(0.5)
          player_fly_key[e.eventobjid] = false
         else
          player_fly_key[e.eventobjid] = false
          Player:changPlayerMoveType(e.eventobjid,1)
        end
      end
      break
    end
  end
end
ScriptSupportEvent:registerEvent([=[Player.InputKeyDown]=],player_fly)
]]
    editor.Text = editor.Text..script
  end
end
function copy.onClick()
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(editor.Text)
  提示("已复制脚本到剪贴板")
end