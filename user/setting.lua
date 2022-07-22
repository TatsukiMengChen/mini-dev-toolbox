require "import"
import "mengchen"
import "theme"
import "com.androlua.LuaUtil"
import "settings"
import "user/setting_layout"
activity.setContentView("user/setting_layout")
wiki.getBackground().setColorFilter(PorterDuffColorFilter(0xFF2196F3,PorterDuff.Mode.SRC_ATOP));
settings = settings_decode()
if settings["script_editor_wiki"] ~= nil then
  wiki.Text = settings["script_editor_wiki"]
end
function Wiki()
  url = string.gsub(wiki.Text,"\n","")
  settings["script_editor_wiki"] = url
  settings_encode(settings)
  path = activity.getLuaDir().."/editor/script_editor/index.html"
  file_line(path,156,'      <iframe src="'..url..'" frameborder="0"></iframe>')
  msg("已将wiki模块设置为\n"..url.."\n设置立即生效")
  --activity.result{"wiki"}
end
sizes=GetFileSize("/sdcard/AndroLua/cache/")
cache_size.Text=sizes
function clean_cache.onClick()
  os.execute("rm -r ".."/sdcard/AndroLua/cache")
  os.execute('mkdir '.."/sdcard/AndroLua/cache")
  提示"缓存清除完毕"
  sizes=GetFileSize("/sdcard/AndroLua/cache/")
  cache_size.Text=sizes
end


